require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_vacinas/new", type: :view do
  before(:each) do
    assign(:socioeduk_saude_jovem_vacina, Socioeduk::SaudeJovemVacina.new(
      :socioeduk_saude_jovem => nil,
      :socioeduk_tipo_vacina => nil
    ))
  end

  xit "renders new socioeduk_saude_jovem_vacina form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_saude_jovem_vacinas_path, "post" do

      assert_select "input[name=?]", "socioeduk_saude_jovem_vacina[socioeduk_saude_jovem_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_vacina[socioeduk_tipo_vacina_id]"
    end
  end
end
