require 'rails_helper'

RSpec.describe "socioeduk/sugestao_relatorios/index", type: :view do
  before(:each) do
    assign(:socioeduk_sugestao_relatorios, [
      Socioeduk::SugestaoRelatorio.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::SugestaoRelatorio.create!(
        :descricao => "Descricao"
      )
    ])
  end

  xit "renders a list of socioeduk/sugestao_relatorios" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
