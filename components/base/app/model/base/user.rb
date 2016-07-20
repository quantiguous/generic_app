module Base
  class User < ActiveRecord::Base
    rolify :role_join_table_name => 'users_roles'
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :session_limitable

    # Setup accessible (or protected) attributes for your model
    # attr_accessible :email, :password, :password_confirmation, :remember_me
    # attr_accessible :title, :body

    Roles = %w{user}

    # Setup accessible (or protected) attributes for your model
    # attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :remember_me, :department_id, :location_id,
    #                 :username, :emp_id, :inactive, :role_ids, :department_location_ids, :supervisor_id, :mobile_no, :receive_sms
    # attr_accessible :title, :body
    validate :role_presence

    def role_presence
      if roles.empty? && Rails.env != "test"
        errors.add(:role, "atleast one role must be added")
        false
      else
        true
      end
    end

    validates :username, :presence => true,
    :uniqueness => {
      :message => "This user id already exists in the system.",
      :case_sensitive => false
    }

    if CONFIG[:authenticate_devise_with_ldap]
      devise :ldap_authenticatable, :trackable
      before_create :get_ldap_name
    else
      validates :email, :presence => true, :format => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
      devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
    end

    def unregistered?
      if inactive
        return true
      end
      return false
    end

    def name
      "#{first_name} #{last_name}(#{username})"
    end

    def sync_from_ldap
      if CONFIG[:authenticate_devise_with_ldap]
        self.first_name = Devise::LdapAdapter.get_ldap_param(self.username, 'givenname') rescue nil
        self.last_name = Devise::LdapAdapter.get_ldap_param(self.username, 'sn') rescue nil
        self.email = Devise::LdapAdapter.get_ldap_param(self.username, 'mail') rescue "#{username}@ratnakarbank.in"
        self.mobile_no = Devise::LdapAdapter.get_ldap_param(self.username, 'mobile') rescue nil
      end
    end

    def get_ldap_name
      self.last_name = Devise::LdapAdapter.get_ldap_param(self.username, 'sn') rescue nil
      self.email = Devise::LdapAdapter.get_ldap_param(self.username, 'mail') rescue "#{username}@ratnakarbank.in"
      self.mobile_no = Devise::LdapAdapter.get_ldap_param(self.username, 'mobile') rescue nil
      if self.last_name.blank?
        errors.add(:username, "Invalid User Id")
        return false
      elsif self.first_name.blank?
        self.first_name = Devise::LdapAdapter.get_ldap_param(self.username, 'givenname') rescue nil
        errors.add(:username, "User Name: #{self.first_name} #{self.last_name}, Kindly validate name before creation.")
        return false
      end
      return true
    end
  end
end
