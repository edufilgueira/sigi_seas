require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_exames/show", type: :view do
  before(:each) do
    @socioeduk_saude_jovem_exame = assign(:socioeduk_saude_jovem_exame, Socioeduk::SaudeJovemExame.create!(
      :socioeduk_saude_jovem => nil,
      :socioeduk_tipo_exame => nil
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
