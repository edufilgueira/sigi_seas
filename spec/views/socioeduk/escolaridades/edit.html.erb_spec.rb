require 'rails_helper'

RSpec.describe "socioeduk/escolaridades/edit", type: :view do
  before(:each) do
    @socioeduk_escolaridade = assign(:socioeduk_escolaridade, Socioeduk::Escolaridade.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_escolaridade form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_escolaridade_path(@socioeduk_escolaridade), "post" do

      assert_select "input[name=?]", "socioeduk_escolaridade[descricao]"
    end
  end
end
