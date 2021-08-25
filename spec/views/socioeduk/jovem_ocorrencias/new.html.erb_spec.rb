require 'rails_helper'

RSpec.describe "socioeduk/jovem_ocorrencias/new", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_ocorrencia, Socioeduk::JovemOcorrencia.new(
      :socioeduk_jovem => nil,
      :socioeduk_tipo_ocorrencia => nil,
      :descricao => "MyString"
    ))
  end

  xit "renders new socioeduk_jovem_ocorrencia form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_jovem_ocorrencias_path, "post" do

      assert_select "input[name=?]", "socioeduk_jovem_ocorrencia[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_jovem_ocorrencia[socioeduk_tipo_ocorrencia_id]"

      assert_select "input[name=?]", "socioeduk_jovem_ocorrencia[descricao]"
    end
  end
end
