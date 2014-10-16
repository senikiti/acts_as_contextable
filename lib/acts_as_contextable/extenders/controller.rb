module ActsAsContextable
  module Extenders

    module Controller
=begin
      def context_params(params_object = params[:context_reference])
        params_object.permit(:votable_id, :votable_type,
          :voter_id, :voter_type,
          :votable, :voter,
          :vote_flag, :vote_scope)
      end
      
      def contextable_params(params_object = params[:context_reference])
        params_object.permit(:vote_registered)
      end
=end
    end
  end
end