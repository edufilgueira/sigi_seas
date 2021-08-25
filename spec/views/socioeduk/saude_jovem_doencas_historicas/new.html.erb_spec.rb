require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_doencas_historicas/new", type: :view do
  before(:each) do
    assign(:socioeduk_saude_jovem_doencas_historica, Socioeduk::SaudeJovemDoencasHistorica.new(
      :socioeduk_saude_jovem => nil,
      :socioeduk_cid => nil,
      :diagnostico => "MyString"
    ))
  end

  xit "renders new socioeduk_saude_jovem_doencas_historica form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_saude_jovem_doencas_historicas_path, "post" do

      assert_select "input[name=?]", "socioeduk_saude_jovem_doencas_historica[socioeduk_saude_jovem_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_doencas_historica[socioeduk_cid_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_doencas_historica[diagnostico]"
    end
  end
end
