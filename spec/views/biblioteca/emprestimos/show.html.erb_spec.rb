require 'rails_helper'

RSpec.describe "biblioteca/emprestimos/show", type: :view do
  before(:each) do
    @biblioteca_emprestimo = assign(:biblioteca_emprestimo, Biblioteca::Emprestimo.create!(
      :biblioteca_livro => "Biblioteca Livro",
      :pessoa => nil,
      :status => 2,
      :nota => "MyText",
      :usuario => nil
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Biblioteca Livro/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
