require 'rails_helper'

RSpec.describe "socioeduk/jovem_transferencias/edit", type: :view do
  before(:each) do
    @socioeduk_jovem_transferencia = assign(:socioeduk_jovem_transferencia, Socioeduk::JovemTransferencia.create!(
      :socioeduk_jovem => nil,
      :unidade_socioeducativa => nil
    ))
  end

  xit "renders the edit socioeduk_jovem_transferencia form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_jovem_transferencia_path(@socioeduk_jovem_transferencia), "post" do

      assert_select "input[name=?]", "socioeduk_jovem_transferencia[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_jovem_transferencia[unidade_socioeducativa_id]"
    end
  end
end
