require 'rails_helper'

RSpec.describe "socioeduk/tipo_decisao_judiciais/show", type: :view do
  before(:each) do
    @socioeduk_tipo_decisao_judicial = assign(:socioeduk_tipo_decisao_judicial, Socioeduk::TipoDecisaoJudicial.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
