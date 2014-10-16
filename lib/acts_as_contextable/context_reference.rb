module ActsAsContextable
  class ContextReference < ActiveRecord::Base
    belongs_to :contextable, polymorphic: true
    belongs_to :context, polymorphic: true
    
    validates_presence_of :contextable_id
    validates_presence_of :context_id
    
  end
end