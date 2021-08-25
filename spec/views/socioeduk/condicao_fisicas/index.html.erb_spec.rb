require 'rails_helper'

RSpec.describe "socioeduk/condicao_fisicas/index", type: :view do
  before(:each) do
    assign(:socioeduk_condicao_fisicas, [
      Socioeduk::CondicaoFisica.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::CondicaoFisica.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/condicao_fisicas" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
