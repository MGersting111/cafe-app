# frozen_string_literal: true

module Management
  module Superadmin
    class BaseController < Management::BaseController
      before_action :check_superadmin_login

      private

      def check_superadmin_login
        return if current_user.super_admin

        redirect_to management_dashboard_path, alert: 'You need to be logged in as a superadmin to access this page'
      end
    end
  end
end
