require 'rails_helper'

RSpec.describe "socioeduk/numero_processos/edit", type: :view do
  before(:each) do
    @socioeduk_numero_processo = assign(:socioeduk_numero_processo, Socioeduk::NumeroProcesso.create!(
      :socioeduk_processo => nil,
      :numero => "MyString"
    ))
  end

  it "renders the edit socioeduk_numero_processo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_numero_processo_path(@socioeduk_numero_processo), "post" do

      assert_select "input[name=?]", "socioeduk_numero_processo[socioeduk_processo_id]"

      assert_select "input[name=?]", "socioeduk_numero_processo[numero]"
    end
  end
end
