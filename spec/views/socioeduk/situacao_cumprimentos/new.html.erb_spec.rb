require 'rails_helper'

RSpec.describe "socioeduk/situacao_cumprimentos/new", type: :view do
  before(:each) do
    assign(:socioeduk_situacao_cumprimento, Socioeduk::SituacaoCumprimento.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_situacao_cumprimento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_situacao_cumprimentos_path, "post" do

      assert_select "input[name=?]", "socioeduk_situacao_cumprimento[descricao]"
    end
  end
end
