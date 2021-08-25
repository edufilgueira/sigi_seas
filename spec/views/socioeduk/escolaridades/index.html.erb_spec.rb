require 'rails_helper'

RSpec.describe "socioeduk/escolaridades/index", type: :view do
  before(:each) do
    assign(:socioeduk_escolaridades, [
      Socioeduk::Escolaridade.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::Escolaridade.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/escolaridades" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
