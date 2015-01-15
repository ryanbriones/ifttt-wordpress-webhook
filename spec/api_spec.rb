require "ifttt_wordpress_webhook/api"

describe IftttWordpressWebhook::Api do
  let(:api) { IftttWordpressWebhook::Api.new }

  context "when detecting paths are required by ifttt but aren't used" do
    it "returns false for paths that don't match" do
      expect(api.required_dumb_path?("/anything")).to be_falsey
    end

    it "returns true for /wp-admin/profile.php" do
      expect(api.required_dumb_path?("/wp-admin/profile.php")).to be_truthy
    end
  end

  context "when detecting the webhook path" do
    it "returns false for paths that don't match" do
      expect(api.webhook_path?("/anything")).to be_falsey
    end

    it "returns true for /xml-rpc.php" do
      expect(api.webhook_path?("/xml-rpc.php")).to be_truthy
    end
  end
end