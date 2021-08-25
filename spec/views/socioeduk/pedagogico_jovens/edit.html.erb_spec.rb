require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovens/edit", type: :view do
  before(:each) do
    @socioeduk_pedagogico_jovem = assign(:socioeduk_pedagogico_jovem, Socioeduk::PedagogicoJovem.create!(
      :socioeduk_jovem => nil,
      :socioeduk_tipo_alfabetizado => nil,
      :socioeduk_situacao_escolar => nil,
      :socioeduk_escolaridade => nil,
      :ultima_escola_frequentada => "MyString",
      :ultimo_ano_escolar => 1,
      :cgm => "MyString",
      :socioeduk_situacao_ocupacional_anterior => 1,
      :socioeduk_situacao_ocupacional_atual => 1
    ))
  end

  xit "renders the edit socioeduk_pedagogico_jovem form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_pedagogico_jovem_path(@socioeduk_pedagogico_jovem), "post" do

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem[socioeduk_tipo_alfabetizado_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem[socioeduk_situacao_escolar_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem[socioeduk_escolaridade_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem[ultima_escola_frequentada]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem[ultimo_ano_escolar]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem[cgm]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem[socioeduk_situacao_ocupacional_anterior]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem[socioeduk_situacao_ocupacional_atual]"
    end
  end
end
