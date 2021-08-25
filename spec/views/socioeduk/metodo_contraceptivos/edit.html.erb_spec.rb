require 'rails_helper'

RSpec.describe "socioeduk/metodo_contraceptivos/edit", type: :view do
  before(:each) do
    @socioeduk_metodo_contraceptivo = assign(:socioeduk_metodo_contraceptivo, Socioeduk::MetodoContraceptivo.create!(
      :descricao => "MyString",
      :ativo => false
    ))
  end

  xit "renders the edit socioeduk_metodo_contraceptivo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_metodo_contraceptivo_path(@socioeduk_metodo_contraceptivo), "post" do

      assert_select "input[name=?]", "socioeduk_metodo_contraceptivo[descricao]"

      assert_select "input[name=?]", "socioeduk_metodo_contraceptivo[ativo]"
    end
  end
end
