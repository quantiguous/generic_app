module ApplicationHelper
  def advanced_search_page_links
    capture do
      concat link_to_if @records.previous_page,  'Previous', "javascript:$('#page').val(#{@records.previous_page});$('form').submit()"
      concat " "
      concat link_to_if @records.next_page, 'Next', "javascript:$('#page').val(#{@records.next_page});$('form').submit()"
    end
  end
end
