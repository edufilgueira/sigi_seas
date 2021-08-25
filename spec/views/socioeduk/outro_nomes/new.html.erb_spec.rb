require 'rails_helper'

RSpec.describe "socioeduk/outro_nomes/new", type: :view do
  before(:each) do
    assign(:socioeduk_outro_nome, Socioeduk::OutroNome.new(
      :socioeduk_jovem => nil,
      :descricao => "MyString"
    ))
  end

  xit "renders new socioeduk_outro_nome form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_outro_nomes_path, "post" do

      assert_select "input[name=?]", "socioeduk_outro_nome[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_outro_nome[descricao]"
    end
  end
end
