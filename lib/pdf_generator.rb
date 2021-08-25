require 'prawn'
require 'prawn/markup'

module PdfGenerator
  PDF_OPTIONS = {
    :page_size   => "A4",
    :page_layout => :portrait,
    :margin      => [0, 0]
  }

  def self.ci_admissao_jovem(texto, path, file_name)
    directory = "#{Rails.root}/#{path}"
    Dir.mkdir(directory) unless File.exists?(directory)
    doc = Prawn::Document.new
    doc.markup_options = {
      text: { align: :justify, size: 10 },
      table: { header: { style: :bold, background_color: 'FFFFDD', size: 10 } }
    }
    doc.image("app/assets/images/logo-seas.png", width: 338, height: 52, position: 100)
    doc.move_down 10
    doc.markup("#{texto}")
    doc.render_file("#{directory}/#{file_name}")
  end
end