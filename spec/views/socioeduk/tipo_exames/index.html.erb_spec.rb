require 'rails_helper'

RSpec.describe "socioeduk/tipo_exames/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_exames, [
      Socioeduk::TipoExame.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoExame.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_exames" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
