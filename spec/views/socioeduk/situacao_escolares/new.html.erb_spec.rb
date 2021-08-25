require 'rails_helper'

RSpec.describe "socioeduk/situacao_escolares/new", type: :view do
  before(:each) do
    assign(:socioeduk_situacao_escolar, Socioeduk::SituacaoEscolar.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_situacao_escolar form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_situacao_escolares_path, "post" do

      assert_select "input[name=?]", "socioeduk_situacao_escolar[descricao]"
    end
  end
end
