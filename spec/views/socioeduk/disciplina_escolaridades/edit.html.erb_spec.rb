require 'rails_helper'

RSpec.describe "socioeduk/disciplina_escolaridades/edit", type: :view do
  before(:each) do
    @socioeduk_disciplina_escolaridade = assign(:socioeduk_disciplina_escolaridade, Socioeduk::DisciplinaEscolaridade.create!(
      :socioeduk_escolaridade => nil,
      :descricao => "MyString"
    ))
  end

  xit "renders the edit socioeduk_disciplina_escolaridade form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_disciplina_escolaridade_path(@socioeduk_disciplina_escolaridade), "post" do

      assert_select "input[name=?]", "socioeduk_disciplina_escolaridade[socioeduk_escolaridade_id]"

      assert_select "input[name=?]", "socioeduk_disciplina_escolaridade[descricao]"
    end
  end
end
