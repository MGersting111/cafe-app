# frozen_string_literal: true

module ApplicationHelper
  FLASH_MAPPING = {
    alert: { class: :danger, icon: 'exclamation-triangle-fill' },
    success: { class: :success, icon: 'check-circle-fill' },
    notice: { class: :light, icon: 'info-circle-fill' }
  }.freeze

  def format_money(cent)
    value = cent / 100.0
    formatted = format('%.2f', value)
    "#{formatted} €"
  end

  def render_qr_code(url)
    qrcode = RQRCode::QRCode.new(url)

    svg_data = qrcode.as_svg(
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 11,
      standalone: true,
      use_path: true
    )

    raw svg_data
  end

  def show_time (time, time_zone = 'Europe/Berlin')
    zone = ActiveSupport::TimeZone[time_zone]
    time.in_time_zone(zone).to_s
  end

  def nav_bar_main_link_target
    user_signed_in? ? management_dashboard_path : root_path
  end
end
