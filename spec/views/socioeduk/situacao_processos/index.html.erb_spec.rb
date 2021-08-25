require 'rails_helper'

RSpec.describe "socioeduk/situacao_processos/index", type: :view do
  before(:each) do
    assign(:socioeduk_situacao_processos, [
      Socioeduk::SituacaoProcesso.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::SituacaoProcesso.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/situacao_processos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
