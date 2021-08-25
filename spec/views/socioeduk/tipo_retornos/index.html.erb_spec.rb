require 'rails_helper'

RSpec.describe "socioeduk/tipo_retornos/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_retornos, [
      Socioeduk::TipoRetorno.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoRetorno.create!(
        :descricao => "Descricao"
      )
    ])
  end

  xit "renders a list of socioeduk/tipo_retornos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
