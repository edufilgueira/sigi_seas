require 'rails_helper'

RSpec.describe "socioeduk/tipo_local_cursos/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_local_cursos, [
      Socioeduk::TipoLocalCurso.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoLocalCurso.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_local_cursos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
