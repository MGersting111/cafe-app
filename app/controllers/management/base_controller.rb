# frozen_string_literal: true

module Management
  class BaseController < ::ApplicationController
    include EnsureLogin
    include EnsureSuperAdmin
  end
end
