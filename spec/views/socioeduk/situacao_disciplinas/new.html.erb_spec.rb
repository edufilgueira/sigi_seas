require 'rails_helper'

RSpec.describe "socioeduk/situacao_disciplinas/new", type: :view do
  before(:each) do
    assign(:socioeduk_situacao_disciplina, Socioeduk::SituacaoDisciplina.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_situacao_disciplina form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_situacao_disciplinas_path, "post" do

      assert_select "input[name=?]", "socioeduk_situacao_disciplina[descricao]"
    end
  end
end
