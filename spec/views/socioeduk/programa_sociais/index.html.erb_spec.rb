require 'rails_helper'

RSpec.describe "socioeduk/programa_sociais/index", type: :view do
  before(:each) do
    assign(:socioeduk_programa_sociais, [
      Socioeduk::ProgramaSocial.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::ProgramaSocial.create!(
        :descricao => "Descricao"
      )
    ])
  end

  xit "renders a list of socioeduk/programa_sociais" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
