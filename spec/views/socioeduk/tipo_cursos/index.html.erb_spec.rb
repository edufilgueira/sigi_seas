require 'rails_helper'

RSpec.describe "socioeduk/tipo_cursos/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_cursos, [
      Socioeduk::TipoCurso.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoCurso.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_cursos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
