require 'rails_helper'

RSpec.describe "socioeduk/visitante_jovens/show", type: :view do
  before(:each) do
    @socioeduk_visitante_jovem = assign(:socioeduk_visitante_jovem, Socioeduk::VisitanteJovem.create!(
      :socioeduk_visitante => nil,
      :socioeduk_jovem => nil,
      :socioeduk_tipo_parentesco => nil
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
