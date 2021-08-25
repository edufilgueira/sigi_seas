require 'rails_helper'

RSpec.describe "socioeduk/situacao_cumprimentos/edit", type: :view do
  before(:each) do
    @socioeduk_situacao_cumprimento = assign(:socioeduk_situacao_cumprimento, Socioeduk::SituacaoCumprimento.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_situacao_cumprimento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_situacao_cumprimento_path(@socioeduk_situacao_cumprimento), "post" do

      assert_select "input[name=?]", "socioeduk_situacao_cumprimento[descricao]"
    end
  end
end
