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
    svg_data = qrcode.as_svg(color: "000", shape_rendering: "crispEdges", module_size: 11, standalone: true, use_path: true)
    raw '<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:ev="http://www.w3.org/2001/xml-events" width="407" height="407" shape-rendering="crispEdges"><path d="M0 0h7v7h-7zM8 0h7v2h1v-2h1v1h1v-1h2v1h-1v1h-2v1h-2v2h-1v-1h-1v-3h-2v1h1v1h-1v1h-2v-1h-1zM21 0h4v1h-1v1h-2v-1h-1zM26 0h1v1h2v1h-3zM30 0h7v7h-7zM1 1v5h5v-5zM9 1v1h1v-1zM20 1h1v1h-1zM31 1v5h5v-5zM2 2h3v3h-3zM19 2h1v1h1v1h-2zM32 2h3v3h-3zM23 3h1v1h1v-1h4v1h-4v1h-1v1h-1v-1h-1v-1h1zM12 4h1v1h1v1h-1v1h-1v-1h-1v-1h1zM17 4h1v2h-1zM8 5h2v1h-1v2h1v1h-2zM15 5h1v1h-1zM19 5h2v2h-1v-1h-1zM27 5h2v3h-1v-2h-1zM10 6h1v1h-1zM14 6h1v1h-1zM16 6h1v2h-1v1h-1v1h-1v1h1v-1h2v1h-1v1h1v-1h1v-1h1v-1h-2v-1h1v-2h1v1h1v1h-1v1h1v-1h1v4h1v1h-1v1h1v-1h1v-2h-1v-1h1v1h1v-1h1v2h-1v3h-1v-1h-1v1h1v2h-1v-1h-1v-1h-2v-1h-1v-1h-1v3h1v-1h1v1h-1v1h1v2h2v-2h-1v-1h1v1h1v1h1v1h-1v1h-2v2h1v-1h1v-1h2v3h-2v-1h-1v1h1v2h1v-1h1v-1h1v-3h1v-1h1v-1h-1v-1h-2v-1h2v1h1v1h1v1h-1v2h-1v1h4v1h-1v1h1v1h-2v-2h-2v1h-1v1h-2v1h-2v-1h-1v-1h-1v1h-1v-1h-1v-1h1v-1h1v-2h-1v-2h-1v-1h-1v-4h-3v-1h-2v-1h2v-1h-3v-1h1v-2h1v2h2v-1h1v-1h1zM22 6h1v1h1v-1h1v2h-1v1h-2zM26 6h1v2h-1zM2 8h3v1h1v-1h1v1h-1v1h1v1h-2v1h-1v-3h-1v1h-1v3h-2v-2h1v-2h1zM29 8h3v1h-1v1h1v1h-1v2h-1v-3h-4v-1h3zM34 8h3v1h-1v1h-2zM8 10h2v2h1v2h1v1h-1v1h1v-1h1v-1h2v2h-2v2h-1v1h2v1h-2v1h-1v2h1v3h-2v-1h-1v-1h-1v-1h1v1h1v-3h-1v-2h1v1h1v-2h-2v-1h-1v-1h-1v-1h-1v-1h-1v-1h1v-1h1v1h-1v1h1v-1h2v-2h-1zM19 10v3h1v-3zM36 10h1v1h-1zM26 11h1v1h-1zM28 11h1v2h1v2h-1v2h-1v-2h-1v-1h-1v-1h-1v-1h1v1h1v1h1zM33 11h1v1h-1zM35 11h1v3h-2v1h-1v-2h-1v-1h1v1h1v-1h1zM3 12h1v3h1v3h-3v-1h2v-1h-1v-1h-2v-1h2zM9 13v4h1v-4zM31 13h1v2h-1zM36 14h1v1h-1zM32 15h1v2h-1zM0 16h1v2h-1zM6 16h1v1h-1zM30 16h1v1h-1zM34 16h2v1h-2zM7 17h1v2h-2v-1h1zM14 17h2v2h-1v-1h-1zM29 17h1v2h-1zM33 17h1v3h1v-2h2v1h-1v1h-1v1h1v-1h1v1h-1v1h-1v1h-1v-2h-2v1h-1v-1h-2v-1h4zM24 18h1v1h-1zM2 19h2v1h-2zM5 19h1v1h-1zM1 20h1v3h-1v1h-1v-2h1zM4 20h1v1h-1zM6 20h1v1h-1zM14 20h1v1h-1zM3 21h1v1h-1zM5 21h1v1h1v1h-1v1h-2v-1h1zM12 21h2v1h-2zM15 22h1v2h-1zM36 22h1v3h-3v1h-1v1h1v-1h1v1h-1v2h-1v1h1v1h-1v3h-1v-1h-1v1h-1v-1h-2v1h-2v-1h-1v-1h1v1h1v-1h1v-1h-1v-1h-1v-1h-2v1h-1v-1h-1v-1h-1v-1h2v-1h3v1h-2v1h2v1h1v-4h-1v-1h1v1h1v1h1v1h-1v1h3v-1h1v-1h-2v-1h3v-1h2v-1h1zM31 23h1v1h-1zM3 24h1v1h-1zM6 24h1v1h-1zM10 24v1h1v-1zM14 24h1v1h-1zM0 25h2v1h-1v3h-1zM5 25h1v1h1v-1h1v2h-2v1h-1v1h-3v-3h2v1h-1v1h1v-1h1zM13 25h1v1h-1zM15 25h3v2h-1v-1h-2zM19 25h1v1h-1zM36 26h1v3h-1zM8 27h1v2h1v-1h1v-1h2v1h-2v1h2v-1h1v-1h1v1h-1v1h1v-1h1v1h-1v1h1v2h-1v1h-1v-3h-6zM18 27h2v2h1v1h1v1h1v1h1v1h-1v4h-2v-1h-1v1h-2v-1h1v-1h-2v-1h-1v-1h1v-1h1v1h-1v1h2v-1h1v-3h-1v1h-1v-1h-1v-2h1zM6 28h1v1h-1zM18 28v1h1v-1zM27 29v1h1v-1zM29 29v3h3v-3zM0 30h7v7h-7zM24 30h1v1h-1zM30 30h1v1h-1zM36 30h1v1h-1zM1 31v5h5v-5zM9 31h1v1h-1zM12 31h1v2h-2v-1h1zM35 31h1v1h1v1h-2v2h-1v1h-2v-1h-1v-1h1v1h1v-1h1v-2h1zM2 32h3v3h-3zM8 32h1v3h-1zM10 33h1v1h-1zM13 33h1v2h1v1h-1v1h-1v-1h-1v1h-1v-2h2zM20 33v1h-1v1h2v-2zM24 33h1v1h-1zM25 34h1v1h-1zM36 34h1v3h-3v-1h2zM16 35h1v1h-1zM21 35v1h1v-1zM24 35h1v1h3v-1h1v1h-1v1h-4zM30 35h1v2h-2v-1h1zM15 36h1v1h-1z" fill="#000" transform="translate(0,0) scale(11)"/></svg>'
  end
end
