require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_programa_sociais/edit", type: :view do
  before(:each) do
    @socioeduk_tecnico_jovem_programa_social = assign(:socioeduk_tecnico_jovem_programa_social, Socioeduk::TecnicoJovemProgramaSocial.create!(
      :socioeduk_tecnico_jovem => nil,
      :socioeduk_programa_social => nil
    ))
  end

  xit "renders the edit socioeduk_tecnico_jovem_programa_social form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tecnico_jovem_programa_social_path(@socioeduk_tecnico_jovem_programa_social), "post" do

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_programa_social[socioeduk_tecnico_jovem_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_programa_social[socioeduk_programa_social_id]"
    end
  end
end
