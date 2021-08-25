require 'rails_helper'

RSpec.describe "socioeduk/saude_jovens_tipo_parentescos/show", type: :view do
  before(:each) do
    @socioeduk_saude_jovens_tipo_parentesco = assign(:socioeduk_saude_jovens_tipo_parentesco, Socioeduk::SaudeJovensTipoParentesco.create!(
      :socioeduk_saude_jovem => nil,
      :socioeduk_tipo_parentesco => nil
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
