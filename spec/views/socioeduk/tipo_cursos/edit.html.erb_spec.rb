require 'rails_helper'

RSpec.describe "socioeduk/tipo_cursos/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_curso = assign(:socioeduk_tipo_curso, Socioeduk::TipoCurso.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_curso form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_curso_path(@socioeduk_tipo_curso), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_curso[descricao]"
    end
  end
end
