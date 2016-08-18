shared_examples "require_sign_in" do
  it "redirects to login page" do
    sign_out_user
    action
    expect(response).to redirect_to new_user_session_path
  end
end


shared_examples "require_course_owner" do
  it "can find course" do
    expect{ action }.to raise_exception ActiveRecord::RecordNotFound
  end
end
