require 'rails_helper'

RSpec.describe "socioeduk/sugestao_relatorios/edit", type: :view do
  before(:each) do
    @socioeduk_sugestao_relatorio = assign(:socioeduk_sugestao_relatorio, Socioeduk::SugestaoRelatorio.create!(
      :descricao => "MyString"
    ))
  end

  xit "renders the edit socioeduk_sugestao_relatorio form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_sugestao_relatorio_path(@socioeduk_sugestao_relatorio), "post" do

      assert_select "input[name=?]", "socioeduk_sugestao_relatorio[descricao]"
    end
  end
end
