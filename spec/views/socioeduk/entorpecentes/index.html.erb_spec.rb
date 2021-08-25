require 'rails_helper'

RSpec.describe "socioeduk/entorpecentes/index", type: :view do
  before(:each) do
    assign(:socioeduk_entorpecentes, [
      Socioeduk::Entorpecente.create!(
        :descricao => "Descricao",
        :unidades_medida => nil,
        :status => false
      ),
      Socioeduk::Entorpecente.create!(
        :descricao => "Descricao",
        :unidades_medida => nil,
        :status => false
      )
    ])
  end

  xit "renders a list of socioeduk/entorpecentes" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
