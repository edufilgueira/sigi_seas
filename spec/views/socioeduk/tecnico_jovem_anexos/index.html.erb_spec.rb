require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_anexos/index", type: :view do
  before(:each) do
    assign(:socioeduk_tecnico_jovem_anexos, [
      Socioeduk::TecnicoJovemAnexo.create!(
        :socioeduk_tecnico_jovem => nil,
        :unidade_socioeducativa => nil
      ),
      Socioeduk::TecnicoJovemAnexo.create!(
        :socioeduk_tecnico_jovem => nil,
        :unidade_socioeducativa => nil
      )
    ])
  end

  xit "renders a list of socioeduk/tecnico_jovem_anexos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
