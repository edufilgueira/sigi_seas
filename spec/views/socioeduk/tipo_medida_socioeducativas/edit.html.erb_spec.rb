require 'rails_helper'

RSpec.describe "socioeduk/tipo_medida_socioeducativas/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_medida_socioeducativa = assign(:socioeduk_tipo_medida_socioeducativa, Socioeduk::TipoMedidaSocioeducativa.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_medida_socioeducativa form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_medida_socioeducativa_path(@socioeduk_tipo_medida_socioeducativa), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_medida_socioeducativa[descricao]"
    end
  end
end
