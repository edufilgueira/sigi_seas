require 'rails_helper'

RSpec.describe "socioeduk/situacao_escolares/index", type: :view do
  before(:each) do
    assign(:socioeduk_situacao_escolares, [
      Socioeduk::SituacaoEscolar.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::SituacaoEscolar.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/situacao_escolares" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
