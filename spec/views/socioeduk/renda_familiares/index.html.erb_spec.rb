require 'rails_helper'

RSpec.describe "socioeduk/renda_familiares/index", type: :view do
  before(:each) do
    assign(:socioeduk_renda_familiares, [
      Socioeduk::RendaFamiliar.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::RendaFamiliar.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/renda_familiares" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
