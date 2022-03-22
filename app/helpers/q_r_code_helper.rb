module QRCodeHelper
  def event_qr_code(event)
    QRCode.new(string: join_event_url(event))
  end
end
