require 'rails_helper'

RSpec.describe "socioeduk/tipo_alfabetizados/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_alfabetizado, Socioeduk::TipoAlfabetizado.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_alfabetizado form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_alfabetizados_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_alfabetizado[descricao]"
    end
  end
end
