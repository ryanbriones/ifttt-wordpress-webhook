# IFTTT Wordpress Webhook

A Rack middleware/app to expose the Wordpress endpoints to act as a webhook for IFTTT.

## Using

Use ifttt-wordpress-webhook like any other Rack middleware/app. Require the gem in your `config.ru` and connect into your Rack application

### As an app

```
# config.ru

require "ifttt_wordpress_webhook/api"

run IftttWordpressWebhook::Api.new
```

### As a middleware

```
# config.ru

require "ifttt_wordpress_webhook/api"

use IftttWordpressWebhook::Api

run MyApp.new
```

## TODO

* Add processing of XML data from IFTTT webhook
* Provide "framework-hook" to allow user to specify hook behavoir
* gemify

## Contact

Questions? Complaints? Concerns? Definitely do not send an email to [Ryan Briones](me@ryanbriones.com)

## License

BSD Licensed. See [LICENSE](./LICENSE)