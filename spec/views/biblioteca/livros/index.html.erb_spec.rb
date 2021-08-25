require 'rails_helper'

RSpec.describe "biblioteca/livros/index", type: :view do
  before(:each) do
    assign(:biblioteca_livros, [
      Biblioteca::Livro.create!(
        :titulo => "Titulo",
        :sinopse => "MyText",
        :biblioteca_autor => nil,
        :biblioteca_local => nil,
        :status => false
      ),
      Biblioteca::Livro.create!(
        :titulo => "Titulo",
        :sinopse => "MyText",
        :biblioteca_autor => nil,
        :biblioteca_local => nil,
        :status => false
      )
    ])
  end

  xit "renders a list of biblioteca/livros" do
    render
    assert_select "tr>td", :text => "Titulo".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
