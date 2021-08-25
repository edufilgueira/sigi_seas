require 'rails_helper'

RSpec.describe "socioeduk/doc_recepcoes/new", type: :view do
  before(:each) do
    assign(:socioeduk_doc_recepcao, Socioeduk::DocRecepcao.new(
      :doc_recepcao => "MyString"
    ))
  end

  it "renders new socioeduk_doc_recepcao form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_doc_recepcoes_path, "post" do

      assert_select "input[name=?]", "socioeduk_doc_recepcao[doc_recepcao]"
    end
  end
end
