require 'rails_helper'

RSpec.describe "socioeduk/jovem_controle_pertences/edit", type: :view do
  before(:each) do
    @socioeduk_jovem_controle_pertence = assign(:socioeduk_jovem_controle_pertence, Socioeduk::JovemControlePertence.create!(
      :socioeduk_jovem_recepcao => nil,
      :nome => "MyString",
      :recebente => "MyString",
      :entregador => "MyString",
      :usuario_new => 1,
      :usuario_update => 1
    ))
  end

  it "renders the edit socioeduk_jovem_controle_pertence form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_jovem_controle_pertence_path(@socioeduk_jovem_controle_pertence), "post" do

      assert_select "input[name=?]", "socioeduk_jovem_controle_pertence[socioeduk_jovem_recepcao_id]"

      assert_select "input[name=?]", "socioeduk_jovem_controle_pertence[nome]"

      assert_select "input[name=?]", "socioeduk_jovem_controle_pertence[recebente]"

      assert_select "input[name=?]", "socioeduk_jovem_controle_pertence[entregador]"

      assert_select "input[name=?]", "socioeduk_jovem_controle_pertence[usuario_new]"

      assert_select "input[name=?]", "socioeduk_jovem_controle_pertence[usuario_update]"
    end
  end
end
