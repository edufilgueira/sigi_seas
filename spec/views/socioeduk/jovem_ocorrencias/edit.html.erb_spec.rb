require 'rails_helper'

RSpec.describe "socioeduk/jovem_ocorrencias/edit", type: :view do
  before(:each) do
    @socioeduk_jovem_ocorrencia = assign(:socioeduk_jovem_ocorrencia, Socioeduk::JovemOcorrencia.create!(
      :socioeduk_jovem => nil,
      :socioeduk_tipo_ocorrencia => nil,
      :descricao => "MyString"
    ))
  end

  xit "renders the edit socioeduk_jovem_ocorrencia form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_jovem_ocorrencia_path(@socioeduk_jovem_ocorrencia), "post" do

      assert_select "input[name=?]", "socioeduk_jovem_ocorrencia[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_jovem_ocorrencia[socioeduk_tipo_ocorrencia_id]"

      assert_select "input[name=?]", "socioeduk_jovem_ocorrencia[descricao]"
    end
  end
end
