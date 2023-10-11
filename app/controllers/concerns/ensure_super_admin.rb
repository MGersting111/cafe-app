# frozen_string_literal: true

module EnsureSuperAdmin
  extend ActiveSupport::Concern

  included do
    before_action :check_superadmin_login
  end

  def check_superadmin_login
    return if current_user.super_admin

    redirect_to management_dashboard_path, alert: 'You need to be logged in as a superadmin to access this page'
  end
end
