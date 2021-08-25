require 'rails_helper'

RSpec.describe "socioeduk/tipo_processos/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_processo = assign(:socioeduk_tipo_processo, Socioeduk::TipoProcesso.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_processo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_processo_path(@socioeduk_tipo_processo), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_processo[descricao]"
    end
  end
end
