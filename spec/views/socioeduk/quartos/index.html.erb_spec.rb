require 'rails_helper'

RSpec.describe "socioeduk/quartos/index", type: :view do
  before(:each) do
    assign(:socioeduk_quartos, [
      Socioeduk::Quarto.create!(
        :unidade_socioeducativa => nil,
        :descricao => "Descricao"
      ),
      Socioeduk::Quarto.create!(
        :unidade_socioeducativa => nil,
        :descricao => "Descricao"
      )
    ])
  end

  xit "renders a list of socioeduk/quartos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
