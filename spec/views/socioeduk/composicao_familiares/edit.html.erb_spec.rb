require 'rails_helper'

RSpec.describe "socioeduk/composicao_familiares/edit", type: :view do
  before(:each) do
    @socioeduk_composicao_familiar = assign(:socioeduk_composicao_familiar, Socioeduk::ComposicaoFamiliar.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_composicao_familiar form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_composicao_familiar_path(@socioeduk_composicao_familiar), "post" do

      assert_select "input[name=?]", "socioeduk_composicao_familiar[descricao]"
    end
  end
end
