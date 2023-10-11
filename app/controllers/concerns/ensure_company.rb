# frozen_string_literal: true

module EnsureCompany
  extend ActiveSupport::Concern

  included do
    before_action :set_company_from_params
    before_action :ensure_company_or_redirect
  end

  def set_company_from_params
    session[:company_id] = params[:company_id] if params[:company_id]

    company = Company.where(id: session[:company_id]).first

    if company
      session[:company_id] = nil
    else
      @current_company = company
    end
  end

  def ensure_company_or_redirect
    if !@current_company
      # redirect_to choose_companies_url
      @current_company = Company.first
    end
  end
end
