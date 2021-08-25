require 'rails_helper'

RSpec.describe "socioeduk/artigo_infracoes/edit", type: :view do
  before(:each) do
    @socioeduk_artigo_infracao = assign(:socioeduk_artigo_infracao, Socioeduk::ArtigoInfracao.create!(
      :descricao => "MyString",
      :ponderacao => "MyString"
    ))
  end

  it "renders the edit socioeduk_artigo_infracao form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_artigo_infracao_path(@socioeduk_artigo_infracao), "post" do

      assert_select "input[name=?]", "socioeduk_artigo_infracao[descricao]"

      assert_select "input[name=?]", "socioeduk_artigo_infracao[ponderacao]"
    end
  end
end
