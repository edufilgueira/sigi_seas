require 'rails_helper'

RSpec.describe "socioeduk/visitante_jovens/index", type: :view do
  before(:each) do
    assign(:socioeduk_visitante_jovens, [
      Socioeduk::VisitanteJovem.create!(
        :socioeduk_visitante => nil,
        :socioeduk_jovem => nil,
        :socioeduk_tipo_parentesco => nil
      ),
      Socioeduk::VisitanteJovem.create!(
        :socioeduk_visitante => nil,
        :socioeduk_jovem => nil,
        :socioeduk_tipo_parentesco => nil
      )
    ])
  end

  xit "renders a list of socioeduk/visitante_jovens" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
