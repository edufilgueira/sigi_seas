require 'rails_helper'

RSpec.describe "socioeduk/local_tratamentos/show", type: :view do
  before(:each) do
    @socioeduk_local_tratamento = assign(:socioeduk_local_tratamento, Socioeduk::LocalTratamento.create!(
      :descricao => "Descricao",
      :status => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(/false/)
  end
end
