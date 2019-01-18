class AssetLabelWorker
  include Sidekiq::Worker
  require 'prawn'


  def perform(asset_tag_id)
    logger.info "More Things are happening."
    a_tag = AssetTag.find(asset_tag_id)
    tag_code = a_tag.tag
    logger.info "Working with the tag #{tag_code}"

    logger.info "Generating QR"
    qr_content = "http://localhost:3000/asset_tags/#{asset_tag_id}"
    qrcode = RQRCode::QRCode.new(qr_content, :level=>:h, :size => 4)

    logger.info "Generating PDF of Label"
    Prawn::Document.generate("hello.pdf") do
      text_box qr_content, :height => 10, :width => 100, :overflow => :shrink_to_fit
      move_down 5
      render_qr_code(qrcode, :dot=>2.5, stroke: false)
      move_down 5
      text tag_code
    end

    logger.info "LETS PRINT!"
    system("lpr -P DYMO_LabelWriter_450_Turbo hello.pdf") or raise "lpr failed"

  end
end
