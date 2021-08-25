require 'rails_helper'

RSpec.describe "socioeduk/jovem_controle_pertences/new", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_controle_pertence, Socioeduk::JovemControlePertence.new(
      :socioeduk_jovem_recepcao => nil,
      :nome => "MyString",
      :recebente => "MyString",
      :entregador => "MyString",
      :usuario_new => 1,
      :usuario_update => 1
    ))
  end

  it "renders new socioeduk_jovem_controle_pertence form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_jovem_controle_pertences_path, "post" do

      assert_select "input[name=?]", "socioeduk_jovem_controle_pertence[socioeduk_jovem_recepcao_id]"

      assert_select "input[name=?]", "socioeduk_jovem_controle_pertence[nome]"

      assert_select "input[name=?]", "socioeduk_jovem_controle_pertence[recebente]"

      assert_select "input[name=?]", "socioeduk_jovem_controle_pertence[entregador]"

      assert_select "input[name=?]", "socioeduk_jovem_controle_pertence[usuario_new]"

      assert_select "input[name=?]", "socioeduk_jovem_controle_pertence[usuario_update]"
    end
  end
end
