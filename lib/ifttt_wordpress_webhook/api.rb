require "rack"

module IftttWordpressWebhook
  REQUIRED_DUMB_PATHS = [
    "/wp-admin/profile.php",
    "/wp-admin/options-general.php",
    "/wp-admin/options-discussion.php"
  ]
  class Api
    def initialize(app = nil)
      @app = app
    end

    def call(env)
      if required_dumb_path?(env["PATH_INFO"])
        return dumb_path_response
      end

      if webhook_path?(env["PATH_INFO"])
        return [
          200, 
          {
            "Content-Type" => "text/plain",
            "Content-Length" => 0
          },
          []
        ]
      end

      @app.call(env)
    end

    def webhook_path?(path)
      return true if path == "/xml-rpc.php"
      return false
    end

    def required_dumb_path?(path)
      return true if REQUIRED_DUMB_PATHS.include?(path) 
      return false
    end

    def dumb_path_response
      [
        301,
        {
          "Content-Type" => "text/plain",
          "Content-Length" => 0,
          "Location" => "/index.php"
        },
        []
      ]
    end
  end
end