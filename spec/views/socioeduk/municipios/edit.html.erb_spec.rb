require 'rails_helper'

RSpec.describe "socioeduk/municipios/edit", type: :view do
  before(:each) do
    @socioeduk_municipio = assign(:socioeduk_municipio, Socioeduk::Municipio.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_municipio form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_municipio_path(@socioeduk_municipio), "post" do

      assert_select "input[name=?]", "socioeduk_municipio[descricao]"
    end
  end
end
