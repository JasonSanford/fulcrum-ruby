# Fulcrum

Fulcrum API Gem

## Requirements

* Ruby 1.9
* [Fulcrum user account](https://web.fulcrumapp.com)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fulcrum'
```

And then execute:

    bundle

Or install it yourself as:

    gem install fulcrum

## Configuration

```ruby
Fulcrum::Api.configure do |config|
  config.uri = 'https://api.fulcrumapp.com/api/v2'
  config.key = 'your_api_key'
end
```

## Projects

```ruby
Fulcrum::Project.all(opts)
# opts = { 'page' => page_number,
#          'updated_since' => date_time }
```

## Forms

```ruby
Fulcrum::Form.all(opts)
# opts = { 'page' => page_number,
#          'schema' => true_or_false }

Fulcrum::Form.find(id, opts)
# opts = { 'include_foreign_elements' => true_or_false }

Fulcrum::Form.create(form)
# form = { 'form' => { ... } }

Fulcrum::Form.update(id, form)
# form = { 'form' => { ... } }

Fulcrum::Form.delete(id)
```

## Records

```ruby
Fulcrum::Record.all(opts)
# opts = { 'page' => page_number,
#          'form_id' => form_id,
#          'bounding_box' => 'lat_bottom,lng_left,lat_top,lng_right',
#          'updated_since' => date_since_epoch_in_seconds }

Fulcrum::Record.find(id)
Fulcrum::Record.create(record)
# record = { 'record' => { ... } }

Fulcrum::Record.update(id, record)
# record = { 'record' => { ... } }

Fulcrum::Record.delete(id)
```

## Photos

```ruby
Fulcrum::Photo.find(access_key, opts)
# opts = { 'format' => 'json|jpg' }, defaults to 'json'

Fulcrum::Photo.thumbnail(access_key, opts)
# opts = { 'format' => 'json|jpg' }, defaults to 'json'

Fulcrum::Photo.create(photo, content_type, unique_id, label)

Fulcrum::Photo.delete(access_key)
```

## Choice Lists

```ruby
Fulcrum::ChoiceList.all(opts)
# opts = { 'page' => page_number }

Fulcrum::ChoiceList.find(id)

Fulcrum::ChoiceList.create(choice_list)
# choice_list = { 'choice_list' => { ... } }

Fulcrum::ChoiceList.update(id, choice_list)
# choice_list = { 'choice_list' => { ... } }

Fulcrum::ChoiceList.delete(id)
```

## Classification Sets

```ruby
Fulcrum::ClassificationSet.all(opts)
# opts = { 'page' => page_number }

Fulcrum::ClassificationSet.find(id)

Fulcrum::ClassificationSet.create(classification_set)
# classification_set = { 'classification_set' => { ... } }

Fulcrum::ClassificationSet.update(id, classification_set)
# classification_set = { 'classification_set' => { ... } }

Fulcrum::ClassificationSet.delete(id)
```

## Users

```ruby
Fulcrum::User.all(opts)
# opts = { 'page' => page_number }

Fulcrum::User.find(id)
```

## Extra Reading

* [Fulcrum API documentation](http://fulcrumapp.com/developers/api/)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
