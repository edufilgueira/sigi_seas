require 'rails_helper'

RSpec.describe "socioeduk/tipo_exames/show", type: :view do
  before(:each) do
    @socioeduk_tipo_exame = assign(:socioeduk_tipo_exame, Socioeduk::TipoExame.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
