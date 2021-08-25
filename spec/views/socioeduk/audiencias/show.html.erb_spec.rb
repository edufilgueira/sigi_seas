require 'rails_helper'

RSpec.describe "socioeduk/audiencias/show", type: :view do
  before(:each) do
    @socioeduk_audiencia = assign(:socioeduk_audiencia, Socioeduk::Audiencia.create!(
      :socioeduk_processo => nil,
      :socioeduk_comarca => nil,
      :numero_processo => "Numero Processo",
      :observacao => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Numero Processo/)
    expect(rendered).to match(/MyText/)
  end
end
