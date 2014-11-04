## JP Post :postbox:

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

## Tracking

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
