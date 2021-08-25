require 'rails_helper'

RSpec.describe "socioeduk/processo_anexos/new", type: :view do
  before(:each) do
    assign(:socioeduk_processo_anexo, Socioeduk::ProcessoAnexo.new(
      :socioeduk_processo => nil
    ))
  end

  xit "renders new socioeduk_processo_anexo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_processo_anexos_path, "post" do

      assert_select "input[name=?]", "socioeduk_processo_anexo[socioeduk_processo_id]"
    end
  end
end
