require 'rails_helper'

RSpec.describe "socioeduk/jovem_saidas/new", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_saida, Socioeduk::JovemSaida.new(
      :socioeduk_jovem => nil,
      :destino => "MyString",
      :observacao => "MyString",
      :text => "MyString"
    ))
  end

  xit "renders new socioeduk_jovem_saida form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_jovem_saidas_path, "post" do

      assert_select "input[name=?]", "socioeduk_jovem_saida[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_jovem_saida[destino]"

      assert_select "input[name=?]", "socioeduk_jovem_saida[observacao]"

      assert_select "input[name=?]", "socioeduk_jovem_saida[text]"
    end
  end
end
