require 'rails_helper'

RSpec.describe "socioeduk/composicao_familiares/index", type: :view do
  before(:each) do
    assign(:socioeduk_composicao_familiares, [
      Socioeduk::ComposicaoFamiliar.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::ComposicaoFamiliar.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/composicao_familiares" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
