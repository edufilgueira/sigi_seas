require 'rails_helper'

RSpec.describe "socioeduk/numero_processos/new", type: :view do
  before(:each) do
    assign(:socioeduk_numero_processo, Socioeduk::NumeroProcesso.new(
      :socioeduk_processo => nil,
      :numero => "MyString"
    ))
  end

  it "renders new socioeduk_numero_processo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_numero_processos_path, "post" do

      assert_select "input[name=?]", "socioeduk_numero_processo[socioeduk_processo_id]"

      assert_select "input[name=?]", "socioeduk_numero_processo[numero]"
    end
  end
end
