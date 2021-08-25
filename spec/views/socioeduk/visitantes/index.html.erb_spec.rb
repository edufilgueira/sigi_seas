require 'rails_helper'

RSpec.describe "socioeduk/visitantes/index", type: :view do
  before(:each) do
    assign(:socioeduk_visitantes, [
      Socioeduk::Visitante.create!(
        :nome => "Nome",
        :socioeduk_jovem => nil,
        :socioeduk_tipo_documento => nil,
        :numero => "Numero",
        :uf_documento => 2,
        :foto => "Foto",
        :observação => "MyText",
        :anexo => "Anexo"
      ),
      Socioeduk::Visitante.create!(
        :nome => "Nome",
        :socioeduk_jovem => nil,
        :socioeduk_tipo_documento => nil,
        :numero => "Numero",
        :uf_documento => 2,
        :foto => "Foto",
        :observação => "MyText",
        :anexo => "Anexo"
      )
    ])
  end

  xit "renders a list of socioeduk/visitantes" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Numero".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Foto".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Anexo".to_s, :count => 2
  end
end
