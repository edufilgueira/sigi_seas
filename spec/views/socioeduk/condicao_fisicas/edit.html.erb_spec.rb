require 'rails_helper'

RSpec.describe "socioeduk/condicao_fisicas/edit", type: :view do
  before(:each) do
    @socioeduk_condicao_fisica = assign(:socioeduk_condicao_fisica, Socioeduk::CondicaoFisica.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_condicao_fisica form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_condicao_fisica_path(@socioeduk_condicao_fisica), "post" do

      assert_select "input[name=?]", "socioeduk_condicao_fisica[descricao]"
    end
  end
end
