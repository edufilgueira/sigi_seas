require 'rails_helper'

RSpec.describe "socioeduk/artigo_infracoes/index", type: :view do
  before(:each) do
    assign(:socioeduk_artigo_infracoes, [
      Socioeduk::ArtigoInfracao.create!(
        :descricao => "Descricao",
        :ponderacao => "Ponderacao"
      ),
      Socioeduk::ArtigoInfracao.create!(
        :descricao => "Descricao",
        :ponderacao => "Ponderacao"
      )
    ])
  end

  it "renders a list of socioeduk/artigo_infracoes" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => "Ponderacao".to_s, :count => 2
  end
end
