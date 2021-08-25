require 'rails_helper'

RSpec.describe "socioeduk/jovem_transferencias/index", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_transferencias, [
      Socioeduk::JovemTransferencia.create!(
        :socioeduk_jovem => nil,
        :unidade_socioeducativa => nil
      ),
      Socioeduk::JovemTransferencia.create!(
        :socioeduk_jovem => nil,
        :unidade_socioeducativa => nil
      )
    ])
  end

  xit "renders a list of socioeduk/jovem_transferencias" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
