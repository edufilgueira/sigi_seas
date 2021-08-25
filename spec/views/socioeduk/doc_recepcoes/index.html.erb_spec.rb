require 'rails_helper'

RSpec.describe "socioeduk/doc_recepcoes/index", type: :view do
  before(:each) do
    assign(:socioeduk_doc_recepcoes, [
      Socioeduk::DocRecepcao.create!(
        :doc_recepcao => "Doc Recepcao"
      ),
      Socioeduk::DocRecepcao.create!(
        :doc_recepcao => "Doc Recepcao"
      )
    ])
  end

  it "renders a list of socioeduk/doc_recepcoes" do
    render
    assert_select "tr>td", :text => "Doc Recepcao".to_s, :count => 2
  end
end
