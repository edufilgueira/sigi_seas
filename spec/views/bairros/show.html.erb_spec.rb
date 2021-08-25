require 'rails_helper'

RSpec.describe "bairros/show", type: :view do
  before(:each) do
    @bairro = assign(:bairro, Bairro.create!(
      :Cidade => "",
      :nome => "Nome"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Nome/)
  end
end
