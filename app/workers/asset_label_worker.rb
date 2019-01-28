class AssetLabelWorker
  include Sidekiq::Worker
  require 'prawn'


  def perform(asset_tag_id)
    logger.info "More Things are happening."
    a_tag = AssetTag.find(asset_tag_id)
    tag_code = a_tag.tag
    logger.info "Working with the tag #{tag_code}"
    part_name = a_tag.consumable.name
    part_number = a_tag.consumable.part.mfg_part
    part_number_int = a_tag.consumable.part.internal_part

    logger.info "Generating QR"
    qr_content = "http://localhost:3000/asset_tags/#{asset_tag_id}"
    qrcode = RQRCode::QRCode.new(qr_content, :level=>:h, :size => 4)

    logger.info "Generating PDF of Label"
    pdf = Prawn::Document.new(:page_size => [145,288], :margin => [2,0,0,0])
      pdf.render_qr_code(qrcode, :dot=>3, stroke: false, :align => :center)
      pdf.move_down 5
      pdf.text "tag_code", :size => 20, :style => :bold, :align => :center
      pdf.move_down 10
      pdf.text_box(qr_content, :height => 10, :width => 144, :overflow => :shrink_to_fit, :align => :center)
      pdf.move_down 5
      pdf.text part_name, :size => 15, :align => :center
      pdf.move_down 10
      pdf.text "Manufacture Part Number", :size => 10, :align => :center
      pdf.text part_number, :size => 15, :align => :center
      pdf.move_down 10
      pdf.text "Internal Part Number", :size => 10, :align => :center
      pdf.text part_number_int, :size => 15, :align => :center
      pdf.render_file "large.pdf"

    logger.info "LETS PRINT!"
    system("lpr -P DYMO_LabelWriter_450_Turbo___raspberrypi large.pdf") or raise "lpr failed"

  end
end
