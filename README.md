## JP Post :postbox:
[![Gem Version](https://badge.fury.io/rb/jp_post.svg)](http://badge.fury.io/rb/jp_post) [![Build Status](https://travis-ci.org/SebastianSzturo/jp_post.svg?branch=master)](https://travis-ci.org/SebastianSzturo/jp_post) [![Code Climate](https://codeclimate.com/github/SebastianSzturo/jp_post/badges/gpa.svg)](https://codeclimate.com/github/SebastianSzturo/jp_post)

A gem to access JP Post Services.

## Requirements
-  Ruby 1.9

## Installation

Add this to your gemfile

```ruby
gem 'jp_post'
```

and

```
bundle
```

## Tracking :round_pushpin:

Track a package with it's item number.

```ruby
package = JpPost::Tracking.new("RR123455678")
```

Access information from the tracking website.

```ruby
package = JpPost::Tracking.new("CI123455678")

package.classification # e.g. Parcel
package.additional_services # Additional Services 
package.history # Array of package movement history
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
