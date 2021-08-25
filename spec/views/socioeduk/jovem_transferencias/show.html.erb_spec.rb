require 'rails_helper'

RSpec.describe "socioeduk/jovem_transferencias/show", type: :view do
  before(:each) do
    @socioeduk_jovem_transferencia = assign(:socioeduk_jovem_transferencia, Socioeduk::JovemTransferencia.create!(
      :socioeduk_jovem => nil,
      :unidade_socioeducativa => nil
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
