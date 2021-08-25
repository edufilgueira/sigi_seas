require 'rails_helper'

RSpec.describe "recursoshumanos/cargo_aditivos/show", type: :view do
  before(:each) do
    @recursoshumanos_cargo_aditivo = assign(:recursoshumanos_cargo_aditivo, Recursoshumanos::CargoAditivo.create!(
      :recursoshumanos_cargo => nil,
      :recursoshumanos_aditivo => nil,
      :qtd_anterior => 2,
      :operacao => "Operacao",
      :qtd_adicionado => 3,
      :qtd_atual => 4
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Operacao/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
