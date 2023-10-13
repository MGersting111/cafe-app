# frozen_string_literal: true

module Administration
  class BaseController < ::ApplicationController
    include EnsureCurrentCompany
    include EnsureLogin
  end
end
