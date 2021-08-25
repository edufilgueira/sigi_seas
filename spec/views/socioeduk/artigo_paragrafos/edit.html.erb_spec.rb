require 'rails_helper'

RSpec.describe "socioeduk/artigo_paragrafos/edit", type: :view do
  before(:each) do
    @socioeduk_artigo_paragrafo = assign(:socioeduk_artigo_paragrafo, Socioeduk::ArtigoParagrafo.create!(
      :socioeduk_artigo_infracao => nil,
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_artigo_paragrafo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_artigo_paragrafo_path(@socioeduk_artigo_paragrafo), "post" do

      assert_select "input[name=?]", "socioeduk_artigo_paragrafo[socioeduk_artigo_infracao_id]"

      assert_select "input[name=?]", "socioeduk_artigo_paragrafo[descricao]"
    end
  end
end
