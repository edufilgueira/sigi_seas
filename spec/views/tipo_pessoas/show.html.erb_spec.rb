require 'rails_helper'

RSpec.describe "tipo_pessoas/show", type: :view do
  before(:each) do
    @tipo_pessoa = assign(:tipo_pessoa, TipoPessoa.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
