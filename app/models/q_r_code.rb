class QRCode
  include ActiveModel::Model
  attr_accessor :string

  mattr_accessor :module_size, default: 7

  def svg
    library_object.as_svg(module_size: module_size).html_safe
  end

  private

  def library_object
    RQRCode::QRCode.new(string)
  end
end
