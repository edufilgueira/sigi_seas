require 'rails_helper'

RSpec.describe "socioeduk/situacao_processos/new", type: :view do
  before(:each) do
    assign(:socioeduk_situacao_processo, Socioeduk::SituacaoProcesso.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_situacao_processo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_situacao_processos_path, "post" do

      assert_select "input[name=?]", "socioeduk_situacao_processo[descricao]"
    end
  end
end
