# Readerly

Most minimalist feed reader ever made.

## Version 0.1 Alpha

### Features

* Self-hosted, deployable anywhere, Heroku-friendly
* River of news style -- no counts, no sidebars with feeds, nothing
* Typographic design
* Keyboard control
* No background jobs (using PubSubHubbub via Superfeedr)

### Opinionated definitions

* Single user app
* Display one feed item at a time
* No list of all items. If you read it, it's gone.
* Authentication by HTTP-Auth
* Feed setup by configuration file

## What may come

* Display all read items
* See read items per feed
* Search
* Send to instapaper

## Technologies

* Rails 4
* Superfeedr through rack-superfeedr (https://github.com/superfeedr/rack-superfeedr)
* Any SQL database

## Requirements

* Superfeedr account (free up to 10k monthly notifications)

## Deploy guide on Heroku

1. Sign up at Heroku and install [Heroku Toolbelt][1]

2. Download and uncompress the latest release found in the [releases page][3]
```
wget https://github.com/chapelaria/readerly/archive/0.1.tar.gz
tar vfzx 0.1.tar.gz
cd readerly-0.1
```

3. Create a new Heroku app with a name that identifies it as yours
```
heroku create <my-app-name>
```

4. Install gems and Initialize the application
```
bundle install
rake app:init
```

5. Add your Heroku app name and the username and password you wish to use to the default configuration file `config/config.yml`
```
general:
  hostname: <my-app-name>.herokuapp.com
  username: username_readerly
  password: password_readerly
```

6. Add your Superfeedr account to config.yml (Create your account [here][2] if you don't have one)
```
superfeedr:
  username: username_superfeedr
  password: password_superfeedr
```

7. Add your feeds to config.yml
```
feeds:
  - http://myfeed1.com/rss
  - http://myfeed2.com/rss
  ...
  - http://myfeed30.com/rss
```
8. Deploy the app
```
rake app:deploy
```

9. Open your app on the default browser
```
heroku open
```

## I've just completed the installation. Why does it say 'No Articles'?

Readerly works in a different (and simpler) way from the other feed readers you might be used to. Instead of reaching out to the individual sources and downloading a bunch of articles from each of them, Readerly just keeps listening for new articles. Whenever a new one gets published, Superfeedr sends it automatically to your app, where it will remain until you get to read it.

[1]: https://toolbelt.heroku.com/
[2]: http://superfeedr.com/subscriber
[3]: https://github.com/chapelaria/readerly/releases

## License

MIT License. Copyright 2013 Chapelaria. http://chapelaria.co
