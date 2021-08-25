require 'rails_helper'

RSpec.describe "socioeduk/tipo_parentescos/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_parentescos, [
      Socioeduk::TipoParentesco.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoParentesco.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_parentescos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
