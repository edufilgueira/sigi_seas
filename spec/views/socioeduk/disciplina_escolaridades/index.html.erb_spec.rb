require 'rails_helper'

RSpec.describe "socioeduk/disciplina_escolaridades/index", type: :view do
  before(:each) do
    assign(:socioeduk_disciplina_escolaridades, [
      Socioeduk::DisciplinaEscolaridade.create!(
        :socioeduk_escolaridade => nil,
        :descricao => "Descricao"
      ),
      Socioeduk::DisciplinaEscolaridade.create!(
        :socioeduk_escolaridade => nil,
        :descricao => "Descricao"
      )
    ])
  end

  xit "renders a list of socioeduk/disciplina_escolaridades" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
