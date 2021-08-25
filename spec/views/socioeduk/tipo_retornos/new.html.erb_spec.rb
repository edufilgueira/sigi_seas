require 'rails_helper'

RSpec.describe "socioeduk/tipo_retornos/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_retorno, Socioeduk::TipoRetorno.new(
      :descricao => "MyString"
    ))
  end

  xit "renders new socioeduk_tipo_retorno form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_retornos_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_retorno[descricao]"
    end
  end
end
