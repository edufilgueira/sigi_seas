require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_exames/index", type: :view do
  before(:each) do
    assign(:socioeduk_saude_jovem_exames, [
      Socioeduk::SaudeJovemExame.create!(
        :socioeduk_saude_jovem => nil,
        :socioeduk_tipo_exame => nil
      ),
      Socioeduk::SaudeJovemExame.create!(
        :socioeduk_saude_jovem => nil,
        :socioeduk_tipo_exame => nil
      )
    ])
  end

  xit "renders a list of socioeduk/saude_jovem_exames" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
