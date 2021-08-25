require 'rails_helper'

RSpec.describe "socioeduk/situacao_ocupacionais/edit", type: :view do
  before(:each) do
    @socioeduk_situacao_ocupacional = assign(:socioeduk_situacao_ocupacional, Socioeduk::SituacaoOcupacional.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_situacao_ocupacional form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_situacao_ocupacional_path(@socioeduk_situacao_ocupacional), "post" do

      assert_select "input[name=?]", "socioeduk_situacao_ocupacional[descricao]"
    end
  end
end
