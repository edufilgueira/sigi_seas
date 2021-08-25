require 'rails_helper'

RSpec.describe "socioeduk/situacao_processos/edit", type: :view do
  before(:each) do
    @socioeduk_situacao_processo = assign(:socioeduk_situacao_processo, Socioeduk::SituacaoProcesso.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_situacao_processo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_situacao_processo_path(@socioeduk_situacao_processo), "post" do

      assert_select "input[name=?]", "socioeduk_situacao_processo[descricao]"
    end
  end
end
