require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovem_profissionalizantes/edit", type: :view do
  before(:each) do
    @socioeduk_pedagogico_jovem_profissionalizante = assign(:socioeduk_pedagogico_jovem_profissionalizante, Socioeduk::PedagogicoJovemProfissionalizante.create!(
      :socioeduk_pedagogico_jovem => nil,
      :socioeduk_tipo_local_curso => nil,
      :nome_programa => "MyString",
      :socioeduk_tipo_curso => nil,
      :nome_curso => "MyString",
      :carga_horaria => "MyString",
      :observacao => "MyText"
    ))
  end

  xit "renders the edit socioeduk_pedagogico_jovem_profissionalizante form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_pedagogico_jovem_profissionalizante_path(@socioeduk_pedagogico_jovem_profissionalizante), "post" do

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_profissionalizante[socioeduk_pedagogico_jovem_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_profissionalizante[socioeduk_tipo_local_curso_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_profissionalizante[nome_programa]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_profissionalizante[socioeduk_tipo_curso_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_profissionalizante[nome_curso]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_profissionalizante[carga_horaria]"

      assert_select "textarea[name=?]", "socioeduk_pedagogico_jovem_profissionalizante[observacao]"
    end
  end
end
