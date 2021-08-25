require 'rails_helper'

RSpec.describe "socioeduk/tipo_vacinas/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_vacina, Socioeduk::TipoVacina.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_vacina form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_vacinas_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_vacina[descricao]"
    end
  end
end
