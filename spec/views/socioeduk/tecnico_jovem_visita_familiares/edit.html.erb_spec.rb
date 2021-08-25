require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_visita_familiares/edit", type: :view do
  before(:each) do
    @socioeduk_tecnico_jovem_visita_familiar = assign(:socioeduk_tecnico_jovem_visita_familiar, Socioeduk::TecnicoJovemVisitaFamiliar.create!(
      :socioeduk_tecnico_jovem => nil,
      :pessoa_visitada => "MyString",
      :finalidade_visita => "MyText",
      :responsavel_realizacao => "MyString"
    ))
  end

  xit "renders the edit socioeduk_tecnico_jovem_visita_familiar form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tecnico_jovem_visita_familiar_path(@socioeduk_tecnico_jovem_visita_familiar), "post" do

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_visita_familiar[socioeduk_tecnico_jovem_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_visita_familiar[pessoa_visitada]"

      assert_select "textarea[name=?]", "socioeduk_tecnico_jovem_visita_familiar[finalidade_visita]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_visita_familiar[responsavel_realizacao]"
    end
  end
end
