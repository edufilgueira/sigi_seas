require 'rails_helper'

RSpec.describe "socioeduk/local_atendimentos/edit", type: :view do
  before(:each) do
    @socioeduk_local_atendimento = assign(:socioeduk_local_atendimento, Socioeduk::LocalAtendimento.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_local_atendimento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_local_atendimento_path(@socioeduk_local_atendimento), "post" do

      assert_select "input[name=?]", "socioeduk_local_atendimento[descricao]"
    end
  end
end
