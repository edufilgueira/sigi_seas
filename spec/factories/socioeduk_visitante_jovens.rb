FactoryBot.define do
  factory :socioeduk_visitante_jovem, class: 'Socioeduk::VisitanteJovem' do
    socioeduk_visitante { nil }
    socioeduk_jovem { nil }
    socioeduk_tipo_parentesco { nil }
  end
end
