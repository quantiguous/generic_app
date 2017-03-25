class BranchesController < ApplicationController
  before_action :authenticate_user!
  before_action :block_inactive_user!
  respond_to :json
  
  def index    
    if request.get?
      # only 'safe/non-personal' parameters are allowed as search parameters in a query string
      @searcher = BranchSearcher.new(params.permit(:page))
    else
      # rest parameters are in post
      @searcher = BranchSearcher.new(search_params)
    end
    @records = @searcher.paginate
  end
  

  private

  def search_params
    params.permit(:page, :cluster_id)
  end
end