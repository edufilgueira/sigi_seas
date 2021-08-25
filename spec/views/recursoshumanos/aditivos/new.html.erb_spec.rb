require 'rails_helper'

RSpec.describe "recursoshumanos/aditivos/new", type: :view do
  before(:each) do
    assign(:recursoshumanos_aditivo, Recursoshumanos::Aditivo.new(
      :recursoshumanos_contrato => nil,
      :recursoshumanos_justificativa_aditivo => nil,
      :numero_processo => "MyString",
      :descricao => "MyString"
    ))
  end

  xit "renders new recursoshumanos_aditivo form" do
    render

    assert_select "form[action=?][method=?]", recursoshumanos_aditivos_path, "post" do

      assert_select "input[name=?]", "recursoshumanos_aditivo[recursoshumanos_contrato_id]"

      assert_select "input[name=?]", "recursoshumanos_aditivo[recursoshumanos_justificativa_aditivo_id]"

      assert_select "input[name=?]", "recursoshumanos_aditivo[numero_processo]"

      assert_select "input[name=?]", "recursoshumanos_aditivo[descricao]"
    end
  end
end
