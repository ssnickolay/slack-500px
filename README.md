slack-500px
======
![Slack.com logo](https://slack.global.ssl.fastly.net/8872/img/landing_slack_hash_wordmark_logo.png "Slack.com")

Bot for Slack chat that posting something to it. (like [slack-plain-bots](https://github.com/yetithefoot/slack-plain-bots))

List of available trigger words:
* __inspiration__ - random images from 500px
* __popular__ - it most popular images (https://500px.com/popular)
* __black_and_white__ - it black and white images
* __*__ - for another trigger words execute search by query. (example: `500px boobs`)

How it works
---

If this bots are integrated, it sends something to channel, where keyword was triggered.
Bot integrates with Slack via its Webhooks mechanism.

Configuring Outgoing Webhook
---

Everything is simple. Lets configure boobs bot. Slack should send a POST request to bot's url ```https://slack-500px.herokuapp.com```, like here:

![Configuring Outgoing Webhook](https://github.com/ssnikolay/slack-500px/blob/master/settings.png "Configuring Outgoing Webhook")

Then it responds with payload to Slack: `500px cat`

Credits
---

Thanx to guys from http://500px.com for great photos API.

P.S. You can use public API (for *not* slack):
- http://slack-500px.herokuapp.com/inspiration
- http://slack-500px.herokuapp.com/search?query=cat
