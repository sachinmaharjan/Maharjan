require "spec_helper"

describe Preview do
  describe "welcome_email" do
    let(:user) {create :user}
    def do_request
      Preview.welcome_email
    end

    it "should render success" do
      do_request
      response.should be_success
    end
  end
end

