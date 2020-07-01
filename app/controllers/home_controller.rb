class HomeController < ApplicationController
  def index
    redirect_to invoices_path
  end
end
