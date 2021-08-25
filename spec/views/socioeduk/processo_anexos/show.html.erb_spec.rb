require 'rails_helper'

RSpec.describe "socioeduk/processo_anexos/show", type: :view do
  before(:each) do
    @socioeduk_processo_anexo = assign(:socioeduk_processo_anexo, Socioeduk::ProcessoAnexo.create!(
      :socioeduk_processo => nil
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
