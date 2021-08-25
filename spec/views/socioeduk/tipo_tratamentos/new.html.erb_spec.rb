require 'rails_helper'

RSpec.describe "socioeduk/tipo_tratamentos/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_tratamento, Socioeduk::TipoTratamento.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_tratamento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_tratamentos_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_tratamento[descricao]"
    end
  end
end
