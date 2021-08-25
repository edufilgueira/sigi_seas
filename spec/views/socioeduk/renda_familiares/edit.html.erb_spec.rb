require 'rails_helper'

RSpec.describe "socioeduk/renda_familiares/edit", type: :view do
  before(:each) do
    @socioeduk_renda_familiar = assign(:socioeduk_renda_familiar, Socioeduk::RendaFamiliar.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_renda_familiar form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_renda_familiar_path(@socioeduk_renda_familiar), "post" do

      assert_select "input[name=?]", "socioeduk_renda_familiar[descricao]"
    end
  end
end
