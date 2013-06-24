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
