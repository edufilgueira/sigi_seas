require 'rails_helper'

RSpec.describe "socioeduk/tipo_alfabetizados/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_alfabetizado = assign(:socioeduk_tipo_alfabetizado, Socioeduk::TipoAlfabetizado.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_alfabetizado form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_alfabetizado_path(@socioeduk_tipo_alfabetizado), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_alfabetizado[descricao]"
    end
  end
end
