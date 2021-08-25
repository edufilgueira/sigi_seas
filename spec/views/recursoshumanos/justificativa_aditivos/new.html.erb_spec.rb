require 'rails_helper'

RSpec.describe "recursoshumanos/justificativa_aditivos/new", type: :view do
  before(:each) do
    assign(:recursoshumanos_justificativa_aditivo, Recursoshumanos::JustificativaAditivo.new(
      :descricao => "MyString"
    ))
  end

  it "renders new recursoshumanos_justificativa_aditivo form" do
    render

    assert_select "form[action=?][method=?]", recursoshumanos_justificativa_aditivos_path, "post" do

      assert_select "input[name=?]", "recursoshumanos_justificativa_aditivo[descricao]"
    end
  end
end
