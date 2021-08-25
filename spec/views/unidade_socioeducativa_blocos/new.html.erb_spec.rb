require 'rails_helper'

RSpec.describe "unidade_socioeducativa_blocos/new", type: :view do
  before(:each) do
    assign(:unidade_socioeducativa_bloco, UnidadeSocioeducativaBloco.new(
      :descricao => "MyString",
      :unidades_socioeducativas => nil
    ))
  end

  it "renders new unidade_socioeducativa_bloco form" do
    render

    assert_select "form[action=?][method=?]", unidade_socioeducativa_blocos_path, "post" do

      assert_select "input[name=?]", "unidade_socioeducativa_bloco[descricao]"

      assert_select "input[name=?]", "unidade_socioeducativa_bloco[unidades_socioeducativas_id]"
    end
  end
end
