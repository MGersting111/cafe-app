# frozen_string_literal: true

module Management
  class CompaniesController < BaseController
    before_action :set_company, only: %i[show edit update destroy]

    def index
      @companies = Company.all
    end

    def show; end

    def new
      @company = Company.new
    end

    def edit; end

    def create
      @company = Company.new(company_params)

      if @company.save
        redirect_to management_companies_path, notice: "Company was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @company.update(company_params)
        redirect_to management_companies_path, notice: "Company was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @company.destroy
      redirect_to management_companies_url, notice: "Company was successfully destroyed.", status: :see_other
    end

    private
      def set_company
        @company = Company.find(params[:id])
      end

      def company_params
        params.require(:company).permit(:name, :description)
      end
  end
end
