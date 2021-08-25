require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_familias/index", type: :view do
  before(:each) do
    assign(:socioeduk_tecnico_jovem_familias, [
      Socioeduk::TecnicoJovemFamilia.create!(
        :socioeduk_tecnico_jovem => nil,
        :nome => "Nome",
        :socioeduk_escolaridade => nil,
        :profissao => "Profissao",
        :socioeduk_tipo_parentesco => nil
      ),
      Socioeduk::TecnicoJovemFamilia.create!(
        :socioeduk_tecnico_jovem => nil,
        :nome => "Nome",
        :socioeduk_escolaridade => nil,
        :profissao => "Profissao",
        :socioeduk_tipo_parentesco => nil
      )
    ])
  end

  xit "renders a list of socioeduk/tecnico_jovem_familias" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Profissao".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
