require 'rails_helper'

RSpec.describe "socioeduk/tipo_tratamentos/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_tratamento = assign(:socioeduk_tipo_tratamento, Socioeduk::TipoTratamento.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_tratamento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_tratamento_path(@socioeduk_tipo_tratamento), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_tratamento[descricao]"
    end
  end
end
