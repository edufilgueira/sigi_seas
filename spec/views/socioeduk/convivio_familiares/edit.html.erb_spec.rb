require 'rails_helper'

RSpec.describe "socioeduk/convivio_familiares/edit", type: :view do
  before(:each) do
    @socioeduk_convivio_familiar = assign(:socioeduk_convivio_familiar, Socioeduk::ConvivioFamiliar.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_convivio_familiar form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_convivio_familiar_path(@socioeduk_convivio_familiar), "post" do

      assert_select "input[name=?]", "socioeduk_convivio_familiar[descricao]"
    end
  end
end
