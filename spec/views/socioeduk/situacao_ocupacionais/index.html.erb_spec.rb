require 'rails_helper'

RSpec.describe "socioeduk/situacao_ocupacionais/index", type: :view do
  before(:each) do
    assign(:socioeduk_situacao_ocupacionais, [
      Socioeduk::SituacaoOcupacional.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::SituacaoOcupacional.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/situacao_ocupacionais" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
