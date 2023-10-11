# frozen_string_literal: true

module Management
  class BaseController < ::ApplicationController
    before_action :check_login
    before_action :check_superadmin_login

    private

    def check_login
      return if current_user.present?

      redirect_to new_user_session_path, alert: 'You need to be logged in to access this page'
    end

    def check_superadmin_login
      return if current_user.super_admin

      redirect_to management_dashboard_path, alert: 'You need to be logged in as a superadmin to access this page'
    end
  end
end
