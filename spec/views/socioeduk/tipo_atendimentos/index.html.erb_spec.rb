require 'rails_helper'

RSpec.describe "socioeduk/tipo_atendimentos/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_atendimentos, [
      Socioeduk::TipoAtendimento.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoAtendimento.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_atendimentos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
