require 'rails_helper'

RSpec.describe "unidade_socioeducativa_blocos/edit", type: :view do
  before(:each) do
    @unidade_socioeducativa_bloco = assign(:unidade_socioeducativa_bloco, UnidadeSocioeducativaBloco.create!(
      :descricao => "MyString",
      :unidades_socioeducativas => nil
    ))
  end

  it "renders the edit unidade_socioeducativa_bloco form" do
    render

    assert_select "form[action=?][method=?]", unidade_socioeducativa_bloco_path(@unidade_socioeducativa_bloco), "post" do

      assert_select "input[name=?]", "unidade_socioeducativa_bloco[descricao]"

      assert_select "input[name=?]", "unidade_socioeducativa_bloco[unidades_socioeducativas_id]"
    end
  end
end
