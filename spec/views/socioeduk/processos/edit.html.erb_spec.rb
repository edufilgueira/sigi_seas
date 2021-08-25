require 'rails_helper'

RSpec.describe "socioeduk/processos/edit", type: :view do
  before(:each) do
    @socioeduk_processo = assign(:socioeduk_processo, Socioeduk::Processo.create!(
      :numero_processo => "MyString",
      :socioeduk_tipo_processo => nil,
      :socioeduk_comarca => nil,
      :numero_oficio => "MyString",
      :socioeduk_situacao_processo => nil,
      :socioeduk_municipio => nil
    ))
  end

  xit "renders the edit socioeduk_processo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_processo_path(@socioeduk_processo), "post" do

      assert_select "input[name=?]", "socioeduk_processo[numero_processo]"

      assert_select "input[name=?]", "socioeduk_processo[socioeduk_tipo_processo_id]"

      assert_select "input[name=?]", "socioeduk_processo[socioeduk_comarca_id]"

      assert_select "input[name=?]", "socioeduk_processo[numero_oficio]"

      assert_select "input[name=?]", "socioeduk_processo[socioeduk_situacao_processo_id]"

      assert_select "input[name=?]", "socioeduk_processo[socioeduk_municipio_id]"
    end
  end
end
