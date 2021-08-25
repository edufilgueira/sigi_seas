require 'rails_helper'

RSpec.describe "socioeduk/situacao_escolares/edit", type: :view do
  before(:each) do
    @socioeduk_situacao_escolar = assign(:socioeduk_situacao_escolar, Socioeduk::SituacaoEscolar.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_situacao_escolar form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_situacao_escolar_path(@socioeduk_situacao_escolar), "post" do

      assert_select "input[name=?]", "socioeduk_situacao_escolar[descricao]"
    end
  end
end
