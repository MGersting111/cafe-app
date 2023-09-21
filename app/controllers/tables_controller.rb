# frozen_string_literal: true

class TablesController < ApplicationController
  before_action :set_table, only: %i[show edit update destroy]

  def index
    @tables = Table.all
  end

  def show; end

  def new
    @table = Table.new
  end

  def edit; end

  def create
    @table = Table.new(table_params)
    if @table.save
      redirect_to table_url(@table), notice: 'Table was successfully created.'
    else
      render :new
    end
  end

  def update
    if @table.update(table_params)
      redirect_to table_url(@table), notice: 'Table was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @table.destroy
    redirect_to tables_url, notice: 'Table was successfully destroyed.'
  end

  private

  def set_table
    @table = Table.find(params[:id])
  end

  def table_params
    params.fetch(:table, {})
  end
end
