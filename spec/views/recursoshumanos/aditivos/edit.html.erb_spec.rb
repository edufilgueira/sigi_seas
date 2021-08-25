require 'rails_helper'

RSpec.describe "recursoshumanos/aditivos/edit", type: :view do
  before(:each) do
    # @recursoshumanos_aditivo = assign(:recursoshumanos_aditivo, Recursoshumanos::Aditivo.create!(
    #   :recursoshumanos_contrato => nil,
    #   :recursoshumanos_justificativa_aditivo => nil,
    #   :numero_processo => "MyString",
    #   :descricao => "MyString"
    # ))
    @recursoshumanos_aditivo = assign(:recursoshumanos_aditivo, FactoryBot.create(:recursoshumanos_aditivo))
  end

  xit "renders the edit recursoshumanos_aditivo form" do
    render

    assert_select "form[action=?][method=?]", recursoshumanos_aditivo_path(@recursoshumanos_aditivo), "post" do

      assert_select "input[name=?]", "recursoshumanos_aditivo[recursoshumanos_contrato_id]"

      assert_select "input[name=?]", "recursoshumanos_aditivo[recursoshumanos_justificativa_aditivo_id]"

      assert_select "input[name=?]", "recursoshumanos_aditivo[numero_processo]"

      assert_select "input[name=?]", "recursoshumanos_aditivo[descricao]"
    end
  end
end
