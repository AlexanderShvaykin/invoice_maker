class OrganizationsController < ApplicationController
  def index
    @organizations = current_user.organizations
  end

  def new
    @organization = Organization.new
  end

  def edit
    organization
    render :new
  end

  def update
    organization.update!(org_params)
    redirect_to organizations_path
  end

  def create
    current_user.organizations.create!(org_params)
    redirect_to organizations_path
  end

  def destroy
    organization.destroy!
    redirect_to organizations_path
  end

  private

  def org_params
    params.require(:organization).permit(:name, :inn, :address, :phone)
  end

  def organization
    @organization ||= current_user.organizations.find(params[:id])
  end
end
