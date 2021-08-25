require 'rails_helper'

RSpec.describe "socioeduk/jovem_documentos/index", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_documentos, [
      Socioeduk::JovemDocumento.create!(
        :socioeduk_jovem => nil,
        :socioeduk_tipo_documento => nil,
        :numero => "Numero",
        :origem_documento => 2,
        :destino_documento => 3
      ),
      Socioeduk::JovemDocumento.create!(
        :socioeduk_jovem => nil,
        :socioeduk_tipo_documento => nil,
        :numero => "Numero",
        :origem_documento => 2,
        :destino_documento => 3
      )
    ])
  end

  xit "renders a list of socioeduk/jovem_documentos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Numero".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
