require 'rails_helper'

RSpec.describe "socioeduk/sugestao_relatorios/new", type: :view do
  before(:each) do
    assign(:socioeduk_sugestao_relatorio, Socioeduk::SugestaoRelatorio.new(
      :descricao => "MyString"
    ))
  end

  xit "renders new socioeduk_sugestao_relatorio form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_sugestao_relatorios_path, "post" do

      assert_select "input[name=?]", "socioeduk_sugestao_relatorio[descricao]"
    end
  end
end
