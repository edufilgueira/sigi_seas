require 'rails_helper'

RSpec.describe "socioeduk/alojamento_jovens/index", type: :view do
  before(:each) do
    assign(:socioeduk_alojamento_jovens, [
      Socioeduk::AlojamentoJovem.create!(
        :socioeduk_jovem => nil,
        :unidade_socioeducativa => nil,
        :socioeduk_bloco => nil,
        :socioeduk_quarto => nil,
        :tamanho_roupa => "Tamanho Roupa",
        :tamanho_cacaldo => "Tamanho Cacaldo",
        :numero_kit => "Numero Kit"
      ),
      Socioeduk::AlojamentoJovem.create!(
        :socioeduk_jovem => nil,
        :unidade_socioeducativa => nil,
        :socioeduk_bloco => nil,
        :socioeduk_quarto => nil,
        :tamanho_roupa => "Tamanho Roupa",
        :tamanho_cacaldo => "Tamanho Cacaldo",
        :numero_kit => "Numero Kit"
      )
    ])
  end

  xit "renders a list of socioeduk/alojamento_jovens" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Tamanho Roupa".to_s, :count => 2
    assert_select "tr>td", :text => "Tamanho Cacaldo".to_s, :count => 2
    assert_select "tr>td", :text => "Numero Kit".to_s, :count => 2
  end
end
