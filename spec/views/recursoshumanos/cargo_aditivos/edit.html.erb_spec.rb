require 'rails_helper'

RSpec.describe "recursoshumanos/cargo_aditivos/edit", type: :view do
  before(:each) do
    @recursoshumanos_cargo_aditivo = assign(:recursoshumanos_cargo_aditivo, FactoryBot.create(:recursoshumanos_cargo_aditivo))
  end

  xit "renders the edit recursoshumanos_cargo_aditivo form" do
    render

    assert_select "form[action=?][method=?]", recursoshumanos_cargo_aditivo_path(@recursoshumanos_cargo_aditivo), "post" do

      assert_select "input[name=?]", "recursoshumanos_cargo_aditivo[recursoshumanos_cargo_id]"

      assert_select "input[name=?]", "recursoshumanos_cargo_aditivo[recursoshumanos_aditivo_id]"

      assert_select "input[name=?]", "recursoshumanos_cargo_aditivo[qtd_anterior]"

      assert_select "input[name=?]", "recursoshumanos_cargo_aditivo[operacao]"

      assert_select "input[name=?]", "recursoshumanos_cargo_aditivo[qtd_adicionado]"

      assert_select "input[name=?]", "recursoshumanos_cargo_aditivo[qtd_atual]"
    end
  end
end
