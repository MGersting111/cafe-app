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
end
