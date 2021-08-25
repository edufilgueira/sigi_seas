require 'rails_helper'

RSpec.describe "socioeduk/situacao_ocupacionais/new", type: :view do
  before(:each) do
    assign(:socioeduk_situacao_ocupacional, Socioeduk::SituacaoOcupacional.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_situacao_ocupacional form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_situacao_ocupacionais_path, "post" do

      assert_select "input[name=?]", "socioeduk_situacao_ocupacional[descricao]"
    end
  end
end
