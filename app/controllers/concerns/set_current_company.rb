# frozen_string_literal: true

module SetCurrentCompany
  extend ActiveSupport::Concern

  included do
    before_action :set_current_company_from_params
  end

  def set_current_company_from_params
    session[:current_company_id] = params[:switch_company] if params[:switch_company]

    company = Company.where(id: session[:current_company_id]).first

    if !company
      session[:current_company_id] = nil
    else
      @current_company = company
    end
  end

  def current_company
    @current_company
  end
end
