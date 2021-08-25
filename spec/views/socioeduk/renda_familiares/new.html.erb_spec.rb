require 'rails_helper'

RSpec.describe "socioeduk/renda_familiares/new", type: :view do
  before(:each) do
    assign(:socioeduk_renda_familiar, Socioeduk::RendaFamiliar.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_renda_familiar form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_renda_familiares_path, "post" do

      assert_select "input[name=?]", "socioeduk_renda_familiar[descricao]"
    end
  end
end
