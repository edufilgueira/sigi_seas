require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_programa_sociais/index", type: :view do
  before(:each) do
    assign(:socioeduk_tecnico_jovem_programa_sociais, [
      Socioeduk::TecnicoJovemProgramaSocial.create!(
        :socioeduk_tecnico_jovem => nil,
        :socioeduk_programa_social => nil
      ),
      Socioeduk::TecnicoJovemProgramaSocial.create!(
        :socioeduk_tecnico_jovem => nil,
        :socioeduk_programa_social => nil
      )
    ])
  end

  xit "renders a list of socioeduk/tecnico_jovem_programa_sociais" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
