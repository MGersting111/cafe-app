# frozen_string_literal: true

class CompaniesController < ApplicationController
  def shop
    if session[:current_company_id]
      redirect_to shop_root_url
    else
      redirect_to select_companies_url
    end
  end

  def select_company
    @companies = Company.all
  end
end
