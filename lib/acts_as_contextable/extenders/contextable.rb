module ActsAsContextable
  module Extenders

    module Contextable

      def contextable?
        false
      end

      def acts_as_contextable
        require 'acts_as_contextable/contextable'
        include ActsAsContextable::Contextable

        class_eval do
          def self.contextable?
            true
          end
        end

      end

    end

  end
end
