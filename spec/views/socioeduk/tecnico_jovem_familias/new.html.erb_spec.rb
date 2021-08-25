require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_familias/new", type: :view do
  before(:each) do
    assign(:socioeduk_tecnico_jovem_familia, Socioeduk::TecnicoJovemFamilia.new(
      :socioeduk_tecnico_jovem => nil,
      :nome => "MyString",
      :socioeduk_escolaridade => nil,
      :profissao => "MyString",
      :socioeduk_tipo_parentesco => nil
    ))
  end

  xit "renders new socioeduk_tecnico_jovem_familia form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tecnico_jovem_familias_path, "post" do

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_familia[socioeduk_tecnico_jovem_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_familia[nome]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_familia[socioeduk_escolaridade_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_familia[profissao]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_familia[socioeduk_tipo_parentesco_id]"
    end
  end
end
