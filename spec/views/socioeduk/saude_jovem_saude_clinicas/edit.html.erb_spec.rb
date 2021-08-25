require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_saude_clinicas/edit", type: :view do
  before(:each) do
    @socioeduk_saude_jovem_saude_clinica = assign(:socioeduk_saude_jovem_saude_clinica, Socioeduk::SaudeJovemSaudeClinica.create!(
      :socioeduk_saude_jovem => nil,
      :odontologico_clinico => false,
      :socioeduk_cid => nil,
      :diagnostico => "MyString",
      :socioeduk_local_tratamento => nil,
      :outro_local_tratamento => "MyString"
    ))
  end

  xit "renders the edit socioeduk_saude_jovem_saude_clinica form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_saude_jovem_saude_clinica_path(@socioeduk_saude_jovem_saude_clinica), "post" do

      assert_select "input[name=?]", "socioeduk_saude_jovem_saude_clinica[socioeduk_saude_jovem_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_saude_clinica[odontologico_clinico]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_saude_clinica[socioeduk_cid_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_saude_clinica[diagnostico]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_saude_clinica[socioeduk_local_tratamento_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_saude_clinica[outro_local_tratamento]"
    end
  end
end
