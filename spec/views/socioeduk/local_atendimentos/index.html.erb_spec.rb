require 'rails_helper'

RSpec.describe "socioeduk/local_atendimentos/index", type: :view do
  before(:each) do
    assign(:socioeduk_local_atendimentos, [
      Socioeduk::LocalAtendimento.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::LocalAtendimento.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/local_atendimentos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
