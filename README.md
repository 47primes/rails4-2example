# Turbo Sport 7

This is a sample app to demonstrate some features in Ruby on Rails. The premise is a website for a world famous beverage vendor.

## Features

* Rails 4.2
* Twitter Bootstrap-based UI
* Pusher Integration
* Braintree Payments Integration
* ActiveJob
* Custom Rake Tasks
* Automated Tests With MiniTest

## Requirements

* Ruby 2.2.x
* Bundler
* A Pusher account (free or paid)
* MySQL

## Installation

### Install Gems

```bundle install```

### Setup Database

```rake db:setup```

### Add Pusher Credentials To Environment

Once you have created a new app in Pusher, create a ```.env``` file in the app root directory and enter the following:

```
PUSHER_APP_ID='<ID>'
PUSHER_KEY='<KEY>'
PUSHER_SECRET='<SECRET>'
```

### Add Braintree Credentials To Environment

Once you have setup a free Braintree sandbox account, create a ```.env``` file in the app root directory and enter the following:

```
BRAINTREE_MERCHANT_ID='<ID>'
BRAINTREE_PUBLIC_KEY='<KEY>'
BRAINTREE_PRIVATE_KEY='<KEY>'
```

### Start The Rails Server

```rails s```

### Start Background Jobs

In order to push order messages and have them appear in the UI, you'll need to start a background process. There are two options for this:

#### Start a delayed_job Worker

To start a worker, run

```./bin/delayed_job start```

To stop the worker, run

```./bin/delayed_job stop```

#### Start OrderSimulatorJob

The OrderSimulatorJob background job creates fake orders at 5-second intervals. The orders will appear in the order feed at the top right-hand corner of the UI.

To start the job, which uses a delayed_job worker, run

```rake order_simulator:start```

To stop the job, run

```rake order_simulator:stop```
