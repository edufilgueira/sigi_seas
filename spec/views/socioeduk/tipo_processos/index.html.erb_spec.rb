require 'rails_helper'

RSpec.describe "socioeduk/tipo_processos/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_processos, [
      Socioeduk::TipoProcesso.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoProcesso.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_processos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
