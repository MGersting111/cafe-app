# frozen_string_literal: true

module Management
  class ErrorsController < BaseController
    def create
      raise 'This is a test error'
    end
  end
end
