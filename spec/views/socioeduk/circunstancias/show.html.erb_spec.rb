require 'rails_helper'

RSpec.describe "socioeduk/circunstancias/show", type: :view do
  before(:each) do
    @socioeduk_circunstancia = assign(:socioeduk_circunstancia, Socioeduk::Circunstancia.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
