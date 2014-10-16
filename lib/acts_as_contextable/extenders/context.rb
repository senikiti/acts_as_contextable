module ActsAsContextable
  module Extenders

    module Context

      def context?
        false
      end

      def acts_as_context(*args)
        require 'acts_as_contextable/context'
        include ActsAsContextable::Context

        class_eval do
          def self.context?
            true
          end
        end

      end

    end
  end
end