require 'rails_helper'

RSpec.describe "socioeduk/numero_processos/index", type: :view do
  before(:each) do
    assign(:socioeduk_numero_processos, [
      Socioeduk::NumeroProcesso.create!(
        :socioeduk_processo => nil,
        :numero => "Numero"
      ),
      Socioeduk::NumeroProcesso.create!(
        :socioeduk_processo => nil,
        :numero => "Numero"
      )
    ])
  end

  it "renders a list of socioeduk/numero_processos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Numero".to_s, :count => 2
  end
end
