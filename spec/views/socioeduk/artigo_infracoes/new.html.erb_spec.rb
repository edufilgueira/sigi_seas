require 'rails_helper'

RSpec.describe "socioeduk/artigo_infracoes/new", type: :view do
  before(:each) do
    assign(:socioeduk_artigo_infracao, Socioeduk::ArtigoInfracao.new(
      :descricao => "MyString",
      :ponderacao => "MyString"
    ))
  end

  it "renders new socioeduk_artigo_infracao form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_artigo_infracoes_path, "post" do

      assert_select "input[name=?]", "socioeduk_artigo_infracao[descricao]"

      assert_select "input[name=?]", "socioeduk_artigo_infracao[ponderacao]"
    end
  end
end
