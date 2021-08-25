require 'rails_helper'

RSpec.describe "socioeduk/tipo_processos/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_processo, Socioeduk::TipoProcesso.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_processo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_processos_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_processo[descricao]"
    end
  end
end
