require 'rails_helper'

RSpec.describe "biblioteca/local_publicacoes/edit", type: :view do
  before(:each) do
    @biblioteca_local_publicacao = assign(:biblioteca_local_publicacao, Biblioteca::LocalPublicacao.create!(
      :descricao => "MyString"
    ))
  end

  xit "renders the edit biblioteca_local_publicacao form" do
    render

    assert_select "form[action=?][method=?]", biblioteca_local_publicacao_path(@biblioteca_local_publicacao), "post" do

      assert_select "input[name=?]", "biblioteca_local_publicacao[descricao]"
    end
  end
end
