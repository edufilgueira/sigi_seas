require 'rails_helper'

RSpec.describe "socioeduk/saude_jovens_tipo_parentescos/index", type: :view do
  before(:each) do
    assign(:socioeduk_saude_jovens_tipo_parentescos, [
      Socioeduk::SaudeJovensTipoParentesco.create!(
        :socioeduk_saude_jovem => nil,
        :socioeduk_tipo_parentesco => nil
      ),
      Socioeduk::SaudeJovensTipoParentesco.create!(
        :socioeduk_saude_jovem => nil,
        :socioeduk_tipo_parentesco => nil
      )
    ])
  end

  xit "renders a list of socioeduk/saude_jovens_tipo_parentescos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
