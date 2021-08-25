require 'rails_helper'

RSpec.describe "biblioteca/local_publicacoes/new", type: :view do
  before(:each) do
    assign(:biblioteca_local_publicacao, Biblioteca::LocalPublicacao.new(
      :descricao => "MyString"
    ))
  end

  xit "renders new biblioteca_local_publicacao form" do
    render

    assert_select "form[action=?][method=?]", biblioteca_local_publicacoes_path, "post" do

      assert_select "input[name=?]", "biblioteca_local_publicacao[descricao]"
    end
  end
end
