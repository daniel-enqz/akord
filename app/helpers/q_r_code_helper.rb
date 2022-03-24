module QRCodeHelper
  def event_qr_code(event)
    QRCode.new(string: short_join_event_url(event.funid))
  end
end
