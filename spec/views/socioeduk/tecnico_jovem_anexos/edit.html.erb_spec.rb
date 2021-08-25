require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_anexos/edit", type: :view do
  before(:each) do
    @socioeduk_tecnico_jovem_anexo = assign(:socioeduk_tecnico_jovem_anexo, Socioeduk::TecnicoJovemAnexo.create!(
      :socioeduk_tecnico_jovem => nil,
      :unidade_socioeducativa => nil
    ))
  end

  xit "renders the edit socioeduk_tecnico_jovem_anexo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tecnico_jovem_anexo_path(@socioeduk_tecnico_jovem_anexo), "post" do

      assert_select "select[name=?]", "socioeduk_tecnico_jovem_anexo[socioeduk_tecnico_jovem_id]"

      assert_select "select[name=?]", "socioeduk_tecnico_jovem_anexo[unidade_socioeducativa_id]"
    end
  end
end
