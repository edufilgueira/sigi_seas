require 'rails_helper'

RSpec.describe "socioeduk/tipo_cursos/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_curso, Socioeduk::TipoCurso.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_curso form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_cursos_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_curso[descricao]"
    end
  end
end
