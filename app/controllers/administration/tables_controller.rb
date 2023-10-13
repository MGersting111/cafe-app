# frozen_string_literal: true

module Administration
  class TablesController < BaseController
    before_action :set_table, only: %i[show edit update destroy qr_code]

    layout 'print', only: :qr_code

    def index
      @tables = Table.all
    end

    def show; end

    def qr_code; end

    def new
      @table = Table.new
    end

    def edit; end

    def create
      @table = Table.new(table_params)
      if @table.save
        redirect_to administration_tables_path, notice: 'Table was successfully created.'
      else
        render :new
      end
    end

    def update
      if @table.update(table_params)
        redirect_to administration_table_path(@table), notice: 'Table was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @table.destroy
      redirect_to administration_tables_path, notice: 'Table was successfully destroyed.'
    end

    private

    def set_table
      @table = Table.find(params[:id])
    end

    def table_params
      params.require(:table).permit(:name)
    end
  end
end
