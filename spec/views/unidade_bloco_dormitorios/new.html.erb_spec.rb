require 'rails_helper'

RSpec.describe "unidade_bloco_dormitorios/new", type: :view do
  before(:each) do
    assign(:unidade_bloco_dormitorio, UnidadeBlocoDormitorio.new(
      :unidade_socioeducativa_blocos => nil,
      :descricao => "MyString",
      :capacidade_base => 1
    ))
  end

  it "renders new unidade_bloco_dormitorio form" do
    render

    assert_select "form[action=?][method=?]", unidade_bloco_dormitorios_path, "post" do

      assert_select "input[name=?]", "unidade_bloco_dormitorio[unidade_socioeducativa_blocos_id]"

      assert_select "input[name=?]", "unidade_bloco_dormitorio[descricao]"

      assert_select "input[name=?]", "unidade_bloco_dormitorio[capacidade_base]"
    end
  end
end
