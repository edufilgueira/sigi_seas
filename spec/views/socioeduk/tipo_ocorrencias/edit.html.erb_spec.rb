require 'rails_helper'

RSpec.describe "socioeduk/tipo_ocorrencias/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_ocorrencia = assign(:socioeduk_tipo_ocorrencia, Socioeduk::TipoOcorrencia.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_ocorrencia form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_ocorrencia_path(@socioeduk_tipo_ocorrencia), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_ocorrencia[descricao]"
    end
  end
end
