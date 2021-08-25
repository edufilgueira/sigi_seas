require 'rails_helper'

RSpec.describe "socioeduk/audiencias/index", type: :view do
  before(:each) do
    assign(:socioeduk_audiencias, [
      Socioeduk::Audiencia.create!(
        :socioeduk_processo => nil,
        :socioeduk_comarca => nil,
        :numero_processo => "Numero Processo",
        :observacao => "MyText"
      ),
      Socioeduk::Audiencia.create!(
        :socioeduk_processo => nil,
        :socioeduk_comarca => nil,
        :numero_processo => "Numero Processo",
        :observacao => "MyText"
      )
    ])
  end

  it "renders a list of socioeduk/audiencias" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Numero Processo".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
