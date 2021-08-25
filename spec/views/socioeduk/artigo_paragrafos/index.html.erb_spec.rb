require 'rails_helper'

RSpec.describe "socioeduk/artigo_paragrafos/index", type: :view do
  before(:each) do
    assign(:socioeduk_artigo_paragrafos, [
      Socioeduk::ArtigoParagrafo.create!(
        :socioeduk_artigo_infracao => nil,
        :descricao => "Descricao"
      ),
      Socioeduk::ArtigoParagrafo.create!(
        :socioeduk_artigo_infracao => nil,
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/artigo_paragrafos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
