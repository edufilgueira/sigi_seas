require 'rails_helper'

RSpec.describe "biblioteca/local_publicacoes/index", type: :view do
  before(:each) do
    assign(:biblioteca_local_publicacoes, [
      Biblioteca::LocalPublicacao.create!(
        :descricao => "Descricao"
      ),
      Biblioteca::LocalPublicacao.create!(
        :descricao => "Descricao"
      )
    ])
  end

  xit "renders a list of biblioteca/local_publicacoes" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
