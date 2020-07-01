RSpec.describe InvoicesController do
  describe "routes" do
    it "have create route" do
      expect(:post => "organizations/12/invoices").to route_to(controller: "invoices", action: "create", organization_id: "12")
    end

    it "have create index route" do
      expect(:get => "/invoices").to route_to(controller: "invoices", action: "index")
    end

    it "have create show route" do
      expect(:get => "/invoices/1").to route_to(controller: "invoices", action: "show", id: "1")
    end
  end

  describe "POST #create", :login do
    subject { post :create, params: { **form_params, organization_id: organization } }

    let(:user) { create :user, :citizen }
    let(:organization) { create :organization, user: user }
    let(:form_params) do
      { item: { name: "Clean", count: 1, price: 100 } }
    end

    it "creates invoice" do
      expect { subject }
        .to change(Invoice, :count).by(1)
        .and change(Invoices::Item, :count).by(1)
    end
  end

  describe "DELETE #destroy", :login do
    subject { delete :destroy, params: { id: invoice } }

    let(:user) { create :user, :citizen }
    let(:organization) { create :organization, user: user }
    let!(:invoice) { create :invoice, user: user, organization: organization, bank: user.citizen.bank }

    it "deletes invoice" do
      expect { subject }.to change(Invoice, :count).by(-1)
    end
  end
end
