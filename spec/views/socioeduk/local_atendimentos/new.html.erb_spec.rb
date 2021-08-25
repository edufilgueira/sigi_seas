require 'rails_helper'

RSpec.describe "socioeduk/local_atendimentos/new", type: :view do
  before(:each) do
    assign(:socioeduk_local_atendimento, Socioeduk::LocalAtendimento.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_local_atendimento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_local_atendimentos_path, "post" do

      assert_select "input[name=?]", "socioeduk_local_atendimento[descricao]"
    end
  end
end
