require 'rails_helper'

RSpec.describe "recursoshumanos/cargo_aditivos/new", type: :view do
  before(:each) do
    assign(:recursoshumanos_cargo_aditivo, Recursoshumanos::CargoAditivo.new(
      :recursoshumanos_cargo => nil,
      :recursoshumanos_aditivo => nil,
      :qtd_anterior => 1,
      :operacao => "MyString",
      :qtd_adicionado => 1,
      :qtd_atual => 1
    ))
  end

  xit "renders new recursoshumanos_cargo_aditivo form" do
    render

    assert_select "form[action=?][method=?]", recursoshumanos_cargo_aditivos_path, "post" do

      assert_select "input[name=?]", "recursoshumanos_cargo_aditivo[recursoshumanos_cargo_id]"

      assert_select "input[name=?]", "recursoshumanos_cargo_aditivo[recursoshumanos_aditivo_id]"

      assert_select "input[name=?]", "recursoshumanos_cargo_aditivo[qtd_anterior]"

      assert_select "input[name=?]", "recursoshumanos_cargo_aditivo[operacao]"

      assert_select "input[name=?]", "recursoshumanos_cargo_aditivo[qtd_adicionado]"

      assert_select "input[name=?]", "recursoshumanos_cargo_aditivo[qtd_atual]"
    end
  end
end
