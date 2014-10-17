module ActsAsContextable
  module Contextable
    def self.included(base)      
      base.class_eval do
        has_many :context_items, :class_name => 'ActsAsContextable::ContextReference', :as => :contextable, :dependent => :destroy do
          def contexts
            includes(:context).map(&:context)
          end
        end
      end
      
    end
    
    def add_to_context context, options = {}
      self.add_to_ctx :context => context #, :context_weight => options[:context_weight]
    end
    
    # put to context
    def add_to_ctx args = {}
      
      options = {}.merge(args)
      
      if options[:context].nil?
        return false
      end

      # find the context
      _context_refs_ = find_contexts_for({
        :context_id => options[:context].id,
        :context_type => options[:context].class.base_class.name
      })

      if _context_refs_.count == 0 or options[:duplicate]
        # this item has never been in context
        context_ref = ActsAsContextable::ContextReference.new(
          :contextable => self,
          :context => options[:context]
        )
      else
        # this context is potentially changing his vote
        context_ref = _context_refs_.last
      end
      
      context_ref.save
    end
    
    def remove_from_context context, options = {}
      self.remove_from_ctx :context => context
    end
    
    def remove_from_ctx args = {}
      return false if args[:context].nil?
      _context_refs_ = find_contexts_for(:context_id => args[:context].id, :context_type => args[:context].class.base_class.name)

      return true if _context_refs_.size == 0
      _context_refs_.each(&:destroy)
      return true
    end
    
    def has_context?
      find_contexts_for().count > 0
    end
    
    def contexts
      find_contexts_for().map(&:context)
    end
    
    def has_contexts_of_a_type? ctxclass
      find_contexts_for(:context_type => ctxclass.base_class.name).count > 0
    end
    
    def contexts_of_a_type ctxclass
      find_contexts_for(:context_type => ctxclass.base_class.name).map(&:context)
    end
    
    def find_contexts_for extra_conditions = {}
      context_items.where(extra_conditions)
    end
    
  end
end