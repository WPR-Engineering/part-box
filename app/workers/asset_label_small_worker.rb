class AssetLabelSmallWorker
  include Sidekiq::Worker
  require 'prawn'


  def perform(asset_tag_id)
    logger.info "More Things are happening. Small Label"
    a_tag = AssetTag.find(asset_tag_id)
    tag_code = a_tag.tag
    logger.info "Working with the tag #{tag_code}"

    logger.info "Generating QR"
    qr_content = "http://localhost:3000/asset_tags/#{asset_tag_id}"
    qrcode = RQRCode::QRCode.new(qr_content, :level=>:h, :size => 4)

    logger.info "Generating PDF of Label"
    pdf = Prawn::Document.new(:page_size => [72,72], :margin => [2,0,0,0])
      pdf.render_qr_code(qrcode, :dot=>1.3, stroke: false, :align => :center)

      pdf.text tag_code, :size => 7, :align => :center
      pdf.render_file "small.pdf"

    logger.info "LETS PRINT!"
    system("lpr -P DYMO_LabelWriter_450_Turbo small.pdf") or raise "lpr failed"

  end
end
