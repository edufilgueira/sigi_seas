require 'rails_helper'

RSpec.describe "socioeduk/circunstancias/edit", type: :view do
  before(:each) do
    @socioeduk_circunstancia = assign(:socioeduk_circunstancia, Socioeduk::Circunstancia.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_circunstancia form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_circunstancia_path(@socioeduk_circunstancia), "post" do

      assert_select "input[name=?]", "socioeduk_circunstancia[descricao]"
    end
  end
end
