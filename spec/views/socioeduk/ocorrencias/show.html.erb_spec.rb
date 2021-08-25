require 'rails_helper'

RSpec.describe "socioeduk/ocorrencias/show", type: :view do
  before(:each) do
    @socioeduk_ocorrencia = assign(:socioeduk_ocorrencia, Socioeduk::Ocorrencia.create!(
      :nome => "Nome",
      :descricao => "Descricao",
      :tipo_ocorrencia => nil
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(//)
  end
end
