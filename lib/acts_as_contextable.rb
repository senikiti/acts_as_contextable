require "acts_as_contextable/version"
require 'active_record'
require 'active_support/inflector'

$LOAD_PATH.unshift(File.dirname(__FILE__))

module ActsAsContextable

  if defined?(ActiveRecord::Base)
    require 'acts_as_contextable/extenders/contextable'
    require 'acts_as_contextable/extenders/context'
    require 'acts_as_contextable/context_reference'
    ActiveRecord::Base.extend ActsAsContextable::Extenders::Contextable
    ActiveRecord::Base.extend ActsAsContextable::Extenders::Context
  end

end

require 'acts_as_contextable/extenders/controller'
ActiveSupport.on_load(:action_controller) do
  include ActsAsContextable::Extenders::Controller
end