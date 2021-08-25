require 'rails_helper'

RSpec.describe "socioeduk/plano_individual_atendimentos/edit", type: :view do
  before(:each) do
    @socioeduk_plano_individual_atendimento = assign(:socioeduk_plano_individual_atendimento, Socioeduk::PlanoIndividualAtendimento.create!(
      :descricao => "MyString"
    ))
  end

  xit "renders the edit socioeduk_plano_individual_atendimento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_plano_individual_atendimento_path(@socioeduk_plano_individual_atendimento), "post" do

      assert_select "input[name=?]", "socioeduk_plano_individual_atendimento[descricao]"
    end
  end
end
