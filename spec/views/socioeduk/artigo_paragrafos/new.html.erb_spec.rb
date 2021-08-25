require 'rails_helper'

RSpec.describe "socioeduk/artigo_paragrafos/new", type: :view do
  before(:each) do
    assign(:socioeduk_artigo_paragrafo, Socioeduk::ArtigoParagrafo.new(
      :socioeduk_artigo_infracao => nil,
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_artigo_paragrafo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_artigo_paragrafos_path, "post" do

      assert_select "input[name=?]", "socioeduk_artigo_paragrafo[socioeduk_artigo_infracao_id]"

      assert_select "input[name=?]", "socioeduk_artigo_paragrafo[descricao]"
    end
  end
end
