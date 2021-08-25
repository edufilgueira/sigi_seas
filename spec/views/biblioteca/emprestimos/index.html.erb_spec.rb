require 'rails_helper'

RSpec.describe "biblioteca/emprestimos/index", type: :view do
  before(:each) do
    assign(:biblioteca_emprestimos, [
      Biblioteca::Emprestimo.create!(
        :biblioteca_livro => "Biblioteca Livro",
        :pessoa => nil,
        :status => 2,
        :nota => "MyText",
        :usuario => nil
      ),
      Biblioteca::Emprestimo.create!(
        :biblioteca_livro => "Biblioteca Livro",
        :pessoa => nil,
        :status => 2,
        :nota => "MyText",
        :usuario => nil
      )
    ])
  end

  xit "renders a list of biblioteca/emprestimos" do
    render
    assert_select "tr>td", :text => "Biblioteca Livro".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
