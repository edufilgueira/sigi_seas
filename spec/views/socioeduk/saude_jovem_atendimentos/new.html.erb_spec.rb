require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_atendimentos/new", type: :view do
  before(:each) do
    assign(:socioeduk_saude_jovem_atendimento, Socioeduk::SaudeJovemAtendimento.new(
      :socioeduk_saude_jovem => nil,
      :socioeduk_tipo_atendimento => nil,
      :local_atendimento => 1,
      :outro_local_atendimento => "MyString",
      :socioeduk_cid => nil,
      :diagnostico => "MyString",
      :nome_profissional => "MyString",
      :descricao_atendimento => "MyString"
    ))
  end

  xit "renders new socioeduk_saude_jovem_atendimento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_saude_jovem_atendimentos_path, "post" do

      assert_select "input[name=?]", "socioeduk_saude_jovem_atendimento[socioeduk_saude_jovem_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_atendimento[socioeduk_tipo_atendimento_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_atendimento[local_atendimento]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_atendimento[outro_local_atendimento]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_atendimento[socioeduk_cid_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_atendimento[diagnostico]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_atendimento[nome_profissional]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_atendimento[descricao_atendimento]"
    end
  end
end
