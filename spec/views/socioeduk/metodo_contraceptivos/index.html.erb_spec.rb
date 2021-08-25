require 'rails_helper'

RSpec.describe "socioeduk/metodo_contraceptivos/index", type: :view do
  before(:each) do
    assign(:socioeduk_metodo_contraceptivos, [
      Socioeduk::MetodoContraceptivo.create!(
        :descricao => "Descricao",
        :ativo => false
      ),
      Socioeduk::MetodoContraceptivo.create!(
        :descricao => "Descricao",
        :ativo => false
      )
    ])
  end

  it "renders a list of socioeduk/metodo_contraceptivos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
