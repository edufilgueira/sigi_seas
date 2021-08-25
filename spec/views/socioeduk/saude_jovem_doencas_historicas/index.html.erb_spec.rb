require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_doencas_historicas/index", type: :view do
  before(:each) do
    assign(:socioeduk_saude_jovem_doencas_historicas, [
      Socioeduk::SaudeJovemDoencasHistorica.create!(
        :socioeduk_saude_jovem => nil,
        :socioeduk_cid => nil,
        :diagnostico => "Diagnostico"
      ),
      Socioeduk::SaudeJovemDoencasHistorica.create!(
        :socioeduk_saude_jovem => nil,
        :socioeduk_cid => nil,
        :diagnostico => "Diagnostico"
      )
    ])
  end

  xit "renders a list of socioeduk/saude_jovem_doencas_historicas" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Diagnostico".to_s, :count => 2
  end
end
