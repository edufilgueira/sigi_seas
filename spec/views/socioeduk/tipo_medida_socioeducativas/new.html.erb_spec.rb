require 'rails_helper'

RSpec.describe "socioeduk/tipo_medida_socioeducativas/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_medida_socioeducativa, Socioeduk::TipoMedidaSocioeducativa.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_medida_socioeducativa form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_medida_socioeducativas_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_medida_socioeducativa[descricao]"
    end
  end
end
