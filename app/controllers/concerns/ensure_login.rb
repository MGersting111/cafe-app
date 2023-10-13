# frozen_string_literal: true

module EnsureLogin
  extend ActiveSupport::Concern

  included do
    before_action :check_login
  end

  def check_login
    return if current_user.present?

    redirect_to new_user_session_path, alert: 'You need to be logged in to access this page'
  end
end
