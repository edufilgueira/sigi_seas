require 'rails_helper'

RSpec.describe "socioeduk/composicao_familiares/new", type: :view do
  before(:each) do
    assign(:socioeduk_composicao_familiar, Socioeduk::ComposicaoFamiliar.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_composicao_familiar form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_composicao_familiares_path, "post" do

      assert_select "input[name=?]", "socioeduk_composicao_familiar[descricao]"
    end
  end
end
