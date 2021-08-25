require 'rails_helper'

RSpec.describe "socioeduk/tipo_tratamentos/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_tratamentos, [
      Socioeduk::TipoTratamento.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoTratamento.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_tratamentos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
