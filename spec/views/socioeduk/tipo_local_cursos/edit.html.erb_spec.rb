require 'rails_helper'

RSpec.describe "socioeduk/tipo_local_cursos/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_local_curso = assign(:socioeduk_tipo_local_curso, Socioeduk::TipoLocalCurso.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_local_curso form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_local_curso_path(@socioeduk_tipo_local_curso), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_local_curso[descricao]"
    end
  end
end
