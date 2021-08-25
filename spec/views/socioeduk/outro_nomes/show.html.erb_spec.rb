require 'rails_helper'

RSpec.describe "socioeduk/outro_nomes/show", type: :view do
  before(:each) do
    @socioeduk_outro_nome = assign(:socioeduk_outro_nome, Socioeduk::OutroNome.create!(
      :socioeduk_jovem => nil,
      :descricao => "Descricao"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Descricao/)
  end
end
