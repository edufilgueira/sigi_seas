require 'rails_helper'

RSpec.describe "socioeduk/tipo_decisao_judiciais/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_decisao_judiciais, [
      Socioeduk::TipoDecisaoJudicial.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoDecisaoJudicial.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_decisao_judiciais" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
