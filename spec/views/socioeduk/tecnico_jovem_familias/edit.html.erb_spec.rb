require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_familias/edit", type: :view do
  before(:each) do
    @socioeduk_tecnico_jovem_familia = assign(:socioeduk_tecnico_jovem_familia, Socioeduk::TecnicoJovemFamilia.create!(
      :socioeduk_tecnico_jovem => nil,
      :nome => "MyString",
      :socioeduk_escolaridade => nil,
      :profissao => "MyString",
      :socioeduk_tipo_parentesco => nil
    ))
  end

  xit "renders the edit socioeduk_tecnico_jovem_familia form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tecnico_jovem_familia_path(@socioeduk_tecnico_jovem_familia), "post" do

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_familia[socioeduk_tecnico_jovem_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_familia[nome]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_familia[socioeduk_escolaridade_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_familia[profissao]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_familia[socioeduk_tipo_parentesco_id]"
    end
  end
end
