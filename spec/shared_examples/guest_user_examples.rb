RSpec.shared_examples "guest user restrictions" do
  before { as_guest }

  it "redirects to sign in page" do
    subject
    expect(response).to redirect_to(new_user_session_path)
  end

  it "sets appropriate flash message" do
    subject
    expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
  end
end
