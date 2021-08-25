require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_anexos/new", type: :view do
  before(:each) do
    assign(:socioeduk_tecnico_jovem_anexo, Socioeduk::TecnicoJovemAnexo.new(
      :socioeduk_tecnico_jovem => nil,
      :unidade_socioeducativa => nil
    ))
  end

  xit "renders new socioeduk_tecnico_jovem_anexo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tecnico_jovem_anexos_path, "post" do

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_anexo[socioeduk_tecnico_jovem_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem_anexo[unidade_socioeducativa_id]"
    end
  end
end
