RSpec.describe CitizensController do
  describe "routes" do
    it "have edit route" do
      expect(:get => "/users/1/citizen").to route_to(controller: "citizens", action: "edit", id: "1")
    end

    it "have update route" do
      expect(:patch => "/citizens/123").to route_to(controller: "citizens", action: "update", id: "123")
    end

    it "have create route" do
      expect(:post => "/citizens").to route_to(controller: "citizens", action: "create")
    end
  end


  describe "#PATCH update", :login do
    subject { patch :update, params: { **form_params, id: user.citizen } }

    let(:user) { create :user, :citizen }
    let(:form_params) do
      {
        citizen: { name: "Foo", last_name: "Foo", inn: "123" },
        bank: { bic: "123" }
      }
    end

    it 'updates citizen' do
      expect { subject }
        .to change { user.citizen.reload.name }.to("Foo")
        .and change { user.citizen.reload.last_name }.to("Foo")
        .and change { user.citizen.reload.inn }.to("123")
        .and change { user.citizen.bank.bic }.to("123")
    end
  end

  describe "#POST create", :login do
    subject { post :create, params: { citizen: form_params } }

    let(:user) { create :user }
    let(:form_params) do
      { name: "Foo", last_name: "Foo", inn: "123" }
    end

    it 'creates citizen' do
      expect { subject }.to change(Citizen, :count).by(1)
    end
  end
end


