require 'rails_helper'

RSpec.describe "biblioteca/locais/show", type: :view do
  before(:each) do
    @biblioteca_local = assign(:biblioteca_local, Biblioteca::Local.create!(
      :nome => "Nome"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
  end
end
