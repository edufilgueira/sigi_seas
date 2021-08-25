require 'rails_helper'

RSpec.describe "socioeduk/plano_individual_atendimentos/index", type: :view do
  before(:each) do
    assign(:socioeduk_plano_individual_atendimentos, [
      Socioeduk::PlanoIndividualAtendimento.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::PlanoIndividualAtendimento.create!(
        :descricao => "Descricao"
      )
    ])
  end

  xit "renders a list of socioeduk/plano_individual_atendimentos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
