require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovem_oficinas/edit", type: :view do
  before(:each) do
    @socioeduk_pedagogico_jovem_oficina = assign(:socioeduk_pedagogico_jovem_oficina, Socioeduk::PedagogicoJovemOficina.create!(
      :socioeduk_pedagogico_jovem => nil,
      :socioeduk_tipo_oficina => nil,
      :nome => "MyString",
      :carga_horaria => "MyString"
    ))
  end

  xit "renders the edit socioeduk_pedagogico_jovem_oficina form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_pedagogico_jovem_oficina_path(@socioeduk_pedagogico_jovem_oficina), "post" do

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_oficina[socioeduk_pedagogico_jovem_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_oficina[socioeduk_tipo_oficina_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_oficina[nome]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_oficina[carga_horaria]"
    end
  end
end
