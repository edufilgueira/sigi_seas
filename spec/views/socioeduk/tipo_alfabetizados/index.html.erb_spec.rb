require 'rails_helper'

RSpec.describe "socioeduk/tipo_alfabetizados/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_alfabetizados, [
      Socioeduk::TipoAlfabetizado.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoAlfabetizado.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_alfabetizados" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
