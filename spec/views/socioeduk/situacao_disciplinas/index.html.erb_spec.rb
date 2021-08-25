require 'rails_helper'

RSpec.describe "socioeduk/situacao_disciplinas/index", type: :view do
  before(:each) do
    assign(:socioeduk_situacao_disciplinas, [
      Socioeduk::SituacaoDisciplina.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::SituacaoDisciplina.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/situacao_disciplinas" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
