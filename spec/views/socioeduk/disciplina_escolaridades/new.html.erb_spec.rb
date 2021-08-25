require 'rails_helper'

RSpec.describe "socioeduk/disciplina_escolaridades/new", type: :view do
  before(:each) do
    assign(:socioeduk_disciplina_escolaridade, Socioeduk::DisciplinaEscolaridade.new(
      :socioeduk_escolaridade => nil,
      :descricao => "MyString"
    ))
  end

  xit "renders new socioeduk_disciplina_escolaridade form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_disciplina_escolaridades_path, "post" do

      assert_select "input[name=?]", "socioeduk_disciplina_escolaridade[socioeduk_escolaridade_id]"

      assert_select "input[name=?]", "socioeduk_disciplina_escolaridade[descricao]"
    end
  end
end
