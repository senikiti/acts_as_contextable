module ActsAsContextable
  module Context
    def self.included(base)      

      base.class_eval do
        
        has_many :in_context_of, :class_name => 'ActsAsContextable::ContextReference', :as => :context, :dependent => :destroy do
          
          def contextables
            includes(:contextable).map(&:contextable)
          end
          
        end
        
      end

    end
  end
end