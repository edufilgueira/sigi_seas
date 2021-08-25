require 'rails_helper'

RSpec.describe "socioeduk/situacao_disciplinas/edit", type: :view do
  before(:each) do
    @socioeduk_situacao_disciplina = assign(:socioeduk_situacao_disciplina, Socioeduk::SituacaoDisciplina.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_situacao_disciplina form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_situacao_disciplina_path(@socioeduk_situacao_disciplina), "post" do

      assert_select "input[name=?]", "socioeduk_situacao_disciplina[descricao]"
    end
  end
end
