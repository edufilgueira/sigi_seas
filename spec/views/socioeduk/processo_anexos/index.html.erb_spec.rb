require 'rails_helper'

RSpec.describe "socioeduk/processo_anexos/index", type: :view do
  before(:each) do
    assign(:socioeduk_processo_anexos, [
      Socioeduk::ProcessoAnexo.create!(
        :socioeduk_processo => nil
      ),
      Socioeduk::ProcessoAnexo.create!(
        :socioeduk_processo => nil
      )
    ])
  end

  xit "renders a list of socioeduk/processo_anexos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
