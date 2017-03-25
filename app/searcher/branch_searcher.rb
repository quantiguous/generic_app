class BranchSearcher
  include ActiveModel::Validations
  attr_accessor :page, :cluster_id

  PER_PAGE =10
  
  validate :validate_search_criteria

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def paginate
    if valid?
      find.page(page).per(PER_PAGE)
    else
      Branch.none.page(page).per(PER_PAGE)
    end
  end

  def export
    find
  end

  private
  def validate_search_criteria
    
  end
  
  def persisted?
    false
  end

  def find
    reln = Branch.order("id desc")
    reln = reln.where("cluster_id=?", cluster_id) if cluster_id.present?
    reln
  end
end
