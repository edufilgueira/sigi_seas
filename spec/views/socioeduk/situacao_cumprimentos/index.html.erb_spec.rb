require 'rails_helper'

RSpec.describe "socioeduk/situacao_cumprimentos/index", type: :view do
  before(:each) do
    assign(:socioeduk_situacao_cumprimentos, [
      Socioeduk::SituacaoCumprimento.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::SituacaoCumprimento.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/situacao_cumprimentos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
