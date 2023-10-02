# frozen_string_literal: true

module Management
  module Superadmin
    class ErrorsController < BaseController
      def create
        raise 'This is a test error'
      end
    end
  end
end
