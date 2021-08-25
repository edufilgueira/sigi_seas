require 'rails_helper'

RSpec.describe "socioeduk/jovem_ocorrencias/index", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_ocorrencias, [
      Socioeduk::JovemOcorrencia.create!(
        :socioeduk_jovem => nil,
        :socioeduk_tipo_ocorrencia => nil,
        :descricao => "Descricao"
      ),
      Socioeduk::JovemOcorrencia.create!(
        :socioeduk_jovem => nil,
        :socioeduk_tipo_ocorrencia => nil,
        :descricao => "Descricao"
      )
    ])
  end

  xit "renders a list of socioeduk/jovem_ocorrencias" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
