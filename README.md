# Acts As Contextable

Acts As Contextable is aruby gem written for Rails/ActiveRecord models.
The gem allows:
- Any model can refer to any other model by adding it to its own context  
- Any model can have multiple various models in context
- Context can be queryed by the class (type) of a model.

## Installation

Add this line to your application's Gemfile:

    gem 'acts_as_contextable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acts_as_contextable

### Database Migrations

Acts As Contextable uses a votes table to store all voting information.  
To generate and run the migration just use.

    rails generate acts_as_votable:migration
    rake db:migrate

## Usage

### Contextable Models

```ruby
class Meeting < ActiveRecord::Base
  acts_as_contextable
end

@meeting = Meeting.new(:name => 'my meeting!')
@meeting.save

@meeting.add_to_context @user
@meeting.add_to_context @place
@meeting.add_to_context @event
etc.

```

### Working with context

```ruby
if @meeting.has_contexts_of_a_type User
	@meeting.contexts_of_a_type(User).each do |user|
		...
	end 
end
```

### Removing from context

```ruby
@meeting.remove_from_context @user
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
