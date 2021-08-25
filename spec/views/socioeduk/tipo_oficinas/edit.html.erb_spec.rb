require 'rails_helper'

RSpec.describe "socioeduk/tipo_oficinas/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_oficina = assign(:socioeduk_tipo_oficina, Socioeduk::TipoOficina.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_oficina form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_oficina_path(@socioeduk_tipo_oficina), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_oficina[descricao]"
    end
  end
end
