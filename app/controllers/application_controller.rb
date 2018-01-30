class ApplicationController < ActionController::Base
  include CurrentUser
  protect_from_forgery with: :exception
  before_action :get_products_categories

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js { head :forbidden, content_type: 'text/html' }
    end
  end

  private

    def get_products_categories
      @products_categories = Category.all
    end
end
