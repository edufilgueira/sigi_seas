require 'rails_helper'

RSpec.describe "socioeduk/processo_anexos/edit", type: :view do
  before(:each) do
    @socioeduk_processo_anexo = assign(:socioeduk_processo_anexo, Socioeduk::ProcessoAnexo.create!(
      :socioeduk_processo => nil
    ))
  end

  xit "renders the edit socioeduk_processo_anexo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_processo_anexo_path(@socioeduk_processo_anexo), "post" do

      assert_select "input[name=?]", "socioeduk_processo_anexo[socioeduk_processo_id]"
    end
  end
end
