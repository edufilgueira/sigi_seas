require 'rails_helper'

RSpec.describe "socioeduk/tipo_parentescos/show", type: :view do
  before(:each) do
    @socioeduk_tipo_parentesco = assign(:socioeduk_tipo_parentesco, Socioeduk::TipoParentesco.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
