require 'rails_helper'

RSpec.describe "socioeduk/tipo_oficinas/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_oficina, Socioeduk::TipoOficina.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_oficina form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_oficinas_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_oficina[descricao]"
    end
  end
end
