require 'rails_helper'

RSpec.describe "socioeduk/metodo_contraceptivos/new", type: :view do
  before(:each) do
    assign(:socioeduk_metodo_contraceptivo, Socioeduk::MetodoContraceptivo.new(
      :descricao => "MyString",
      :ativo => false
    ))
  end

  it "renders new socioeduk_metodo_contraceptivo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_metodo_contraceptivos_path, "post" do

      assert_select "input[name=?]", "socioeduk_metodo_contraceptivo[descricao]"

      assert_select "input[name=?]", "socioeduk_metodo_contraceptivo[ativo]"
    end
  end
end
