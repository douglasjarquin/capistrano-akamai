# Capistrano::Akamai

A capistrano plugin that can be used to purge or invalidate Akamai cache post deploy. Currently, it only provides one task, but in the idea is to generate dynamic lists of files based on the latest SCM changes.

## Tasks

```
cap akamai:invalidate:cpcode # Mark the cached content in a cpcode as invalid
```

## Purge vs. Invalidate

Purge:
> Remove the content from Akamai edge server caches. The next time the edge server receives a request for the content, it will retrieve the current version from the origin server. If it cannot retrieve a current version, it will follow instructions in your edge server configuration.
> _Note that "Purge" can increase the load on the origin more than "Invalidate". With 'invalidate', objects are not removed from cache and full objects are not retrieved from the origin unless they are newer than the cached versions._

Invalidate:

> Mark the cached content as invalid. The next time the Akamai edge server receives a request for the content, it will send an HTTP conditional get (If-Modified-Since) request to the origin. If the content has changed, the origin server will return a full fresh copy; otherwise, the origin normally will respond that the content has not changed, and Akamai can serve the already-cached content.

## Installation

Add this line to your application's Gemfile:

```
gem 'capistrano-akamai'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install capistrano-akamai
```

## Usage

Add this line to the top of your `deploy.rb`:

```
require 'capistrano/akamai'
```

Then supply the required configuration variables.

In your `deploy.rb`:

```
set :akamai_username, ''
set :akamai_password, ''
set :akamai_cpcode, ''
set :akamai_emails, [''] # optional
```

Or with environment variables:

```
# akamai
export AKAMAI_USERNAME=""
export AKAMAI_PASSWORD=""
export AKAMAI_CPCODE=""
```

Lastly, add the task after deploy:

```
after 'deploy', 'akamai:invalidate:cpcode'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
