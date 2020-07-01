require 'rails_helper'

RSpec.describe OrganizationsController do
  let(:user) { create :user }

  describe "routes" do
    it "have index route" do
      expect(:get => "/organizations").to route_to(controller: "organizations", action: "index")
    end
    it "have new route" do
      expect(:get => "/organizations/new").to route_to(controller: "organizations", action: "new")
    end
    it "have create route" do
      expect(:post => "/organizations").to route_to(controller: "organizations", action: "create")
    end
    it "have destroy route" do
      expect(:delete => "/organizations/1").to route_to(controller: "organizations", action: "destroy", id: "1")
    end
    it "have edit route" do
      expect(:get => "/organizations/1/edit").to route_to(controller: "organizations", action: "edit", id: "1")
    end
  end

  describe "GET #index", :login do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update", :login do
    subject { patch :update, params: { organization: form_params, id: organization } }

    let(:form_params) do
      { name: "New company", inn: "123" }
    end
    let(:user) { create :user }
    let!(:organization) { create :organization, user: user }

    it "updates organization" do
      expect { subject }
        .to change { organization.reload.name }.to("New company")
        .and change { organization.reload.inn }.to("123")
    end
  end

  describe "POST #create", :login do
    subject { post :create, params: { organization: form_params } }

    let(:user) { create :user }
    let(:form_params) do
      { name: "New company" }
    end

    it "creates new organization" do
      expect { subject }
        .to change(Organization, :count).by(1)
        .and change { user.organizations.count }.by(1)
    end
  end


  describe "DELETE #destroy", :login do
    subject { delete :destroy, params: { id: organization } }

    let(:user) { create :user }
    let!(:organization) { create :organization, user: user }

    it "deletes organization" do
      expect { subject }.to change(Organization, :count).by(-1)
    end
  end
end
