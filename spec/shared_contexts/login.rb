RSpec.shared_context "with login", login: true do
  before do
    login_user(user)
  end
end
