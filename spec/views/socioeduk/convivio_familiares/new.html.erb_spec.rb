require 'rails_helper'

RSpec.describe "socioeduk/convivio_familiares/new", type: :view do
  before(:each) do
    assign(:socioeduk_convivio_familiar, Socioeduk::ConvivioFamiliar.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_convivio_familiar form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_convivio_familiares_path, "post" do

      assert_select "input[name=?]", "socioeduk_convivio_familiar[descricao]"
    end
  end
end
