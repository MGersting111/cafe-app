# frozen_string_literal: true

module Administration
  class BaseController < ::ApplicationController
    include EnsureCompany
    include EnsureLogin
  end
end
