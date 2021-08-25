require 'rails_helper'

RSpec.describe "socioeduk/tipo_local_cursos/show", type: :view do
  before(:each) do
    @socioeduk_tipo_local_curso = assign(:socioeduk_tipo_local_curso, Socioeduk::TipoLocalCurso.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
