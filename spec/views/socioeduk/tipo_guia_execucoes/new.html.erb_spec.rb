require 'rails_helper'

RSpec.describe "socioeduk/tipos/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo, Socioeduk::TipoGuiaExecucao.new(
      :descricao => "MyString"
    ))
  end

  xit "renders new socioeduk_tipo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_guia_execucoes_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo[descricao]"
    end
  end
end
