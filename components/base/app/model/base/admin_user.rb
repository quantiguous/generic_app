module Base 
  class AdminUser < ActiveRecord::Base
    rolify :role_cname => 'Base::AdminRole', :role_join_table_name => 'admin_users_admin_roles'
    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable,
    # :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable,
           :rememberable, :trackable, :validatable, :timeoutable, :session_limitable

    # Setup accessible (or protected) attributes for your model
    # attr_accessible :email, :username, :password, :password_confirmation, :remember_me, :inactive
    # attr_accessible :title, :body
    validates :username,
    :uniqueness => {
      :case_sensitive => false
    }

    def name
      username
    end
  end
end