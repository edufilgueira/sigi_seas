require 'rails_helper'

RSpec.describe "socioeduk/tipo_ocorrencias/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_ocorrencia, Socioeduk::TipoOcorrencia.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_ocorrencia form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_ocorrencias_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_ocorrencia[descricao]"
    end
  end
end
