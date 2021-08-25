require 'rails_helper'

RSpec.describe "socioeduk/jovem_transferencias/new", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_transferencia, Socioeduk::JovemTransferencia.new(
      :socioeduk_jovem => nil,
      :unidade_socioeducativa => nil
    ))
  end

  xit "renders new socioeduk_jovem_transferencia form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_jovem_transferencias_path, "post" do

      assert_select "input[name=?]", "socioeduk_jovem_transferencia[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_jovem_transferencia[unidade_socioeducativa_id]"
    end
  end
end
