require 'rails_helper'

RSpec.describe "socioeduk/tipo_atendimentos/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_atendimento, Socioeduk::TipoAtendimento.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_atendimento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_atendimentos_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_atendimento[descricao]"
    end
  end
end
