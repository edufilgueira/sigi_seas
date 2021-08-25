require 'rails_helper'

RSpec.describe "socioeduk/municipios/new", type: :view do
  before(:each) do
    assign(:socioeduk_municipio, Socioeduk::Municipio.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_municipio form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_municipios_path, "post" do

      assert_select "input[name=?]", "socioeduk_municipio[descricao]"
    end
  end
end
