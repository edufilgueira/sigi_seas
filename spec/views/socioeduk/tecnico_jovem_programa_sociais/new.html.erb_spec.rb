require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_programa_sociais/new", type: :view do
  before(:each) do
    assign(:socioeduk_tecnico_jovem_programa_social, Socioeduk::TecnicoJovemProgramaSocial.new(
      :socioeduk_tecnico_jovem => nil,
      :socioeduk_programa_social => nil
    ))
  end

  xit "renders new socioeduk_tecnico_jovem_programa_social form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tecnico_jovem_programa_sociais_path, "post" do

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_programa_social[socioeduk_tecnico_jovem_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_programa_social[socioeduk_programa_social_id]"
    end
  end
end
