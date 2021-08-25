require 'rails_helper'

RSpec.describe "socioeduk/ocorrencias/new", type: :view do
  before(:each) do
    assign(:socioeduk_ocorrencia, Socioeduk::Ocorrencia.new(
      :nome => "MyString",
      :descricao => "MyString",
      :tipo_ocorrencia => nil
    ))
  end

  xit "renders new socioeduk_ocorrencia form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_ocorrencias_path, "post" do

      assert_select "input[name=?]", "socioeduk_ocorrencia[nome]"

      assert_select "input[name=?]", "socioeduk_ocorrencia[descricao]"

      assert_select "input[name=?]", "socioeduk_ocorrencia[tipo_ocorrencia_id]"
    end
  end
end
