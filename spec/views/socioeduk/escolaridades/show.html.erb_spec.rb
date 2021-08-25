require 'rails_helper'

RSpec.describe "socioeduk/escolaridades/show", type: :view do
  before(:each) do
    @socioeduk_escolaridade = assign(:socioeduk_escolaridade, Socioeduk::Escolaridade.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
