require 'rails_helper'

RSpec.describe "socioeduk/blocos/index", type: :view do
  before(:each) do
    assign(:socioeduk_blocos, [
      Socioeduk::Bloco.create!(
        :unidade_socioeducativa => nil,
        :descricao => "Descricao"
      ),
      Socioeduk::Bloco.create!(
        :unidade_socioeducativa => nil,
        :descricao => "Descricao"
      )
    ])
  end

  xit "renders a list of socioeduk/blocos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
