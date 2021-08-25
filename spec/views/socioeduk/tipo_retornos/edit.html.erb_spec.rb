require 'rails_helper'

RSpec.describe "socioeduk/tipo_retornos/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_retorno = assign(:socioeduk_tipo_retorno, Socioeduk::TipoRetorno.create!(
      :descricao => "MyString"
    ))
  end

  xit "renders the edit socioeduk_tipo_retorno form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_retorno_path(@socioeduk_tipo_retorno), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_retorno[descricao]"
    end
  end
end
