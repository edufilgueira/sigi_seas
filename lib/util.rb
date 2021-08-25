class Util

  def self.dias_semana
    ["Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"]
  end

  def self.generate_file_csv(file, headers, lines)
    CSV.open(file, 'w', write_headers: true, headers: headers, external_encoding: "ISO8859-1", internal_encoding: "utf-8") do |writer|
      lines.each do |line|
        writer << line
      end
    end
  end

end