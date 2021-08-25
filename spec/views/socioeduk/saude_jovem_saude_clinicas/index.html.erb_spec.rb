require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_saude_clinicas/index", type: :view do
  before(:each) do
    assign(:socioeduk_saude_jovem_saude_clinicas, [
      Socioeduk::SaudeJovemSaudeClinica.create!(
        :socioeduk_saude_jovem => nil,
        :odontologico_clinico => false,
        :socioeduk_cid => nil,
        :diagnostico => "Diagnostico",
        :socioeduk_local_tratamento => nil,
        :outro_local_tratamento => "Outro Local Tratamento"
      ),
      Socioeduk::SaudeJovemSaudeClinica.create!(
        :socioeduk_saude_jovem => nil,
        :odontologico_clinico => false,
        :socioeduk_cid => nil,
        :diagnostico => "Diagnostico",
        :socioeduk_local_tratamento => nil,
        :outro_local_tratamento => "Outro Local Tratamento"
      )
    ])
  end

  xit "renders a list of socioeduk/saude_jovem_saude_clinicas" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Diagnostico".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Outro Local Tratamento".to_s, :count => 2
  end
end
