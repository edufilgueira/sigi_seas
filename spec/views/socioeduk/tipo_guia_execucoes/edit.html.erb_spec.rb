require 'rails_helper'

RSpec.describe "socioeduk/tipos/edit", type: :view do
  before(:each) do
    @socioeduk_tipo = assign(:socioeduk_tipo, Socioeduk::TipoGuiaExecucao.create!(
      :descricao => "MyString"
    ))
  end

  xit "renders the edit socioeduk_tipo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_path(@socioeduk_tipo), "post" do

      assert_select "input[name=?]", "socioeduk_tipo[descricao]"
    end
  end
end
