require 'rails_helper'

RSpec.describe "socioeduk/ocorrencias/edit", type: :view do
  before(:each) do
    @socioeduk_ocorrencia = assign(:socioeduk_ocorrencia, Socioeduk::Ocorrencia.create!(
      :nome => "MyString",
      :descricao => "MyString",
      :tipo_ocorrencia => nil
    ))
  end

  xit "renders the edit socioeduk_ocorrencia form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_ocorrencia_path(@socioeduk_ocorrencia), "post" do

      assert_select "input[name=?]", "socioeduk_ocorrencia[nome]"

      assert_select "input[name=?]", "socioeduk_ocorrencia[descricao]"

      assert_select "input[name=?]", "socioeduk_ocorrencia[tipo_ocorrencia_id]"
    end
  end
end
