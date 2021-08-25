require 'rails_helper'

RSpec.describe "socioeduk/tipo_vacinas/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_vacinas, [
      Socioeduk::TipoVacina.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoVacina.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_vacinas" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
