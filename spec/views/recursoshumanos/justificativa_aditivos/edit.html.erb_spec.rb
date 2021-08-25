require 'rails_helper'

RSpec.describe "recursoshumanos/justificativa_aditivos/edit", type: :view do
  before(:each) do
    @recursoshumanos_justificativa_aditivo = assign(:recursoshumanos_justificativa_aditivo, Recursoshumanos::JustificativaAditivo.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit recursoshumanos_justificativa_aditivo form" do
    render

    assert_select "form[action=?][method=?]", recursoshumanos_justificativa_aditivo_path(@recursoshumanos_justificativa_aditivo), "post" do

      assert_select "input[name=?]", "recursoshumanos_justificativa_aditivo[descricao]"
    end
  end
end
