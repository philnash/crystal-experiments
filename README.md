# Crystal Experiments with the [Twilio API](https://www.twilio.com/docs/api)

These are some experiments using [Crystal](https://crystal-lang.org/) to access the [Twilio API](https://www.twilio.com/docs/api).

* [Sending an SMS with Crystal](/philnash/crystal-experiments/blob/master/src/sms.cr)

More coming soon...

## Setup

To use the code, you will need to [install Crystal](https://crystal-lang.org/docs/installation/index.html).

Ensure your Crystal installation is working by checking the version on the command line:

```bash
$ crystal --version
Crystal 0.19.4 (2016-10-21)
```

### Credentials

To test out these experiments, you will need a Twilio account. You can [sign up for a free Twilio account here](https://www.twilio.com/try-twilio). You need to get your Twilio Account SID and Auth Token to authenticate with Twilio. You will also need a [Twilio number](https://www.twilio.com/console/phone-numbers/incoming) that can send SMS messages.

These experiments use environment variables to keep credentials and other secrets out of this repository. You will need to export your credentials to the environment, like so:

```bash
$ export TWILIO_ACCOUNT_SID=YOUR_TWILIO_ACCOUNT_SID
$ export TWILIO_AUTH_TOKEN=YOUR_TWILIO_AUTH_TOKEN
$ export TWILIO_NUMBER=YOUR_TWILIO_NUMBER
$ export MY_NUMBER=YOUR_PHONE_NUMBER
```

## Run the examples

Once you have Crystal installed and your credentials saved in the environment, you can compile and run the experiment with:

```bash
$ crystal src/sms.cr
```

## Questions, comments, issues?

Either send them to [issues](/philnash/crystal-experiments/issues) or let me know on Twitter at [@philnash](https://twitter.com/philnash).
