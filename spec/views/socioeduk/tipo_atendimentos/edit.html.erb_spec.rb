require 'rails_helper'

RSpec.describe "socioeduk/tipo_atendimentos/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_atendimento = assign(:socioeduk_tipo_atendimento, Socioeduk::TipoAtendimento.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_atendimento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_atendimento_path(@socioeduk_tipo_atendimento), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_atendimento[descricao]"
    end
  end
end
