class DocumentsController < ApplicationController
  def index
    @category_ids = params[:category_ids] || []
    if @category_ids.empty?
      @documents = Document.all
    else
      @documents = Document.where(category_id: @category_ids)
    end
    @categories = Category.all
  end
end