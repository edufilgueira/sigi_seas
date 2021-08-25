require 'rails_helper'

RSpec.describe "socioeduk/situacao_disciplinas/show", type: :view do
  before(:each) do
    @socioeduk_situacao_disciplina = assign(:socioeduk_situacao_disciplina, Socioeduk::SituacaoDisciplina.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
