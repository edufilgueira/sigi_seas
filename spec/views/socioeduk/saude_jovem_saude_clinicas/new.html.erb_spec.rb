require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_saude_clinicas/new", type: :view do
  before(:each) do
    assign(:socioeduk_saude_jovem_saude_clinica, Socioeduk::SaudeJovemSaudeClinica.new(
      :socioeduk_saude_jovem => nil,
      :odontologico_clinico => false,
      :socioeduk_cid => nil,
      :diagnostico => "MyString",
      :socioeduk_local_tratamento => nil,
      :outro_local_tratamento => "MyString"
    ))
  end

  xit "renders new socioeduk_saude_jovem_saude_clinica form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_saude_jovem_saude_clinicas_path, "post" do

      assert_select "input[name=?]", "socioeduk_saude_jovem_saude_clinica[socioeduk_saude_jovem_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_saude_clinica[odontologico_clinico]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_saude_clinica[socioeduk_cid_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_saude_clinica[diagnostico]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_saude_clinica[socioeduk_local_tratamento_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_saude_clinica[outro_local_tratamento]"
    end
  end
end
