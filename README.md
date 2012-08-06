# Kredentials

Gem allows to define config constants for different Rails environments.

## Installation

Add this line to your application's Gemfile:

    gem 'kredentials'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kredentials

## Usage

    class HostConfig
      extend Credentials

      @@development = {
          :my_host => 'www.local.myhost.com',
          :my_subdomain => 'www.local',
      }

      @@test = {
          :my_host => 'mobi.test.myhost.com',
          :my_subdomain => 'mobi.test',
      }

      @@production = {
          :my_host => 'www.myhost.com',
          :my_subdomain => 'www',
      }
    end


    HostConfig.my_host  # will return my_host based on the Rails environment you are in

# Credits

[Oha_extensions](https://github.com/bkr/oha_extensions) is maintained by [Bookrenter/Rafter](http://github.com/bkr) and is funded by [BookRenter.com](http://www.bookrenter.com "BookRenter.com").

![BookRenter.com Logo](http://assets0.bookrenter.com/images/header/bookrenter_logo.gif "BookRenter.com")

# Copyright

Copyright (c) 2012 Bookrenter.com. See LICENSE.txt for further details.