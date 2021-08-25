require 'rails_helper'

RSpec.describe "socioeduk/local_atendimentos/show", type: :view do
  before(:each) do
    @socioeduk_local_atendimento = assign(:socioeduk_local_atendimento, Socioeduk::LocalAtendimento.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
