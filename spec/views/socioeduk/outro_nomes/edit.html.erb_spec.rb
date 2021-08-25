require 'rails_helper'

RSpec.describe "socioeduk/outro_nomes/edit", type: :view do
  before(:each) do
    @socioeduk_outro_nome = assign(:socioeduk_outro_nome, Socioeduk::OutroNome.create!(
      :socioeduk_jovem => "MyString",
      :descricao => "MyString"
    ))
  end

  xit "renders the edit socioeduk_outro_nome form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_outro_nome_path(@socioeduk_outro_nome), "post" do

      assert_select "select[name=?]", "socioeduk_outro_nome[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_outro_nome[descricao]"
    end
  end
end
