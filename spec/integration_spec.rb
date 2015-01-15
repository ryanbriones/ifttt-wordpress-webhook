require "spec_helper"

require "ifttt_wordpress_webhook/api"

describe "IftttWordpressWebhook::Api Integration" do
  include Rack::Test::Methods
  
  def root_app
    lambda { |env| [404, {"Content-Type" => "text/plain", "Content-Type" => 0}, []]}
  end

  def app
    IftttWordpressWebhook::Api.new(root_app)
  end

  context "required wp-admin endpoints" do
    it "responds to profile.php" do
      get "/wp-admin/profile.php"
      expect(last_response).to be_redirection
    end

    it "responds to options-general.php" do
      get "/wp-admin/options-general.php"
      expect(last_response).to be_redirection
    end

    it "responds to options-discussion.php" do
      get "/wp-admin/options-discussion.php"
      expect(last_response).to be_redirection
    end
  end

  context "ifttt webhook processing" do
    it "responds successfully to proper ifttt webhook requests" do
      post "/xml-rpc.php", "<xml></xml>" do |response|
        expect(response).to be_ok
      end
    end
  end
end