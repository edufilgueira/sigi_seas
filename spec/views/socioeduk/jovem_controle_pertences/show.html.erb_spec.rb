require 'rails_helper'

RSpec.describe "socioeduk/jovem_controle_pertences/show", type: :view do
  before(:each) do
    @socioeduk_jovem_controle_pertence = assign(:socioeduk_jovem_controle_pertence, Socioeduk::JovemControlePertence.create!(
      :socioeduk_jovem_recepcao => nil,
      :nome => "Nome",
      :recebente => "Recebente",
      :entregador => "Entregador",
      :usuario_new => 2,
      :usuario_update => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Recebente/)
    expect(rendered).to match(/Entregador/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
