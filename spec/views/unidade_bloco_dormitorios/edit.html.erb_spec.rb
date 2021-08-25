require 'rails_helper'

RSpec.describe "unidade_bloco_dormitorios/edit", type: :view do
  before(:each) do
    @unidade_bloco_dormitorio = assign(:unidade_bloco_dormitorio, UnidadeBlocoDormitorio.create!(
      :unidade_socioeducativa_blocos => nil,
      :descricao => "MyString",
      :capacidade_base => 1
    ))
  end

  it "renders the edit unidade_bloco_dormitorio form" do
    render

    assert_select "form[action=?][method=?]", unidade_bloco_dormitorio_path(@unidade_bloco_dormitorio), "post" do

      assert_select "input[name=?]", "unidade_bloco_dormitorio[unidade_socioeducativa_blocos_id]"

      assert_select "input[name=?]", "unidade_bloco_dormitorio[descricao]"

      assert_select "input[name=?]", "unidade_bloco_dormitorio[capacidade_base]"
    end
  end
end
