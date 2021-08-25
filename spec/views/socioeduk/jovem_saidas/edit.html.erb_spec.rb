require 'rails_helper'

RSpec.describe "socioeduk/jovem_saidas/edit", type: :view do
  before(:each) do
    @socioeduk_jovem_saida = assign(:socioeduk_jovem_saida, Socioeduk::JovemSaida.create!(
      :socioeduk_jovem => nil,
      :destino => "MyString",
      :observacao => "MyString",
      :text => "MyString"
    ))
  end

  xit "renders the edit socioeduk_jovem_saida form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_jovem_saida_path(@socioeduk_jovem_saida), "post" do

      assert_select "input[name=?]", "socioeduk_jovem_saida[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_jovem_saida[destino]"

      assert_select "input[name=?]", "socioeduk_jovem_saida[observacao]"

      assert_select "input[name=?]", "socioeduk_jovem_saida[text]"
    end
  end
end
