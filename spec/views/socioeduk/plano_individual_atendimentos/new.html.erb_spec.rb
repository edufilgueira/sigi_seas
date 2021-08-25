require 'rails_helper'

RSpec.describe "socioeduk/plano_individual_atendimentos/new", type: :view do
  before(:each) do
    assign(:socioeduk_plano_individual_atendimento, Socioeduk::PlanoIndividualAtendimento.new(
      :descricao => "MyString"
    ))
  end

  xit "renders new socioeduk_plano_individual_atendimento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_plano_individual_atendimentos_path, "post" do

      assert_select "input[name=?]", "socioeduk_plano_individual_atendimento[descricao]"
    end
  end
end
