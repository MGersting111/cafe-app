# frozen_string_literal: true

module EnsureCurrentCompany
  extend ActiveSupport::Concern

  included do
    before_action :ensure_current_company_or_redirect
  end

  def ensure_current_company_or_redirect
    if !@current_company
      redirect_to select_companies_url
      @current_company = Company.first
    end
  end
end
