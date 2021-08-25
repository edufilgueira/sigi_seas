require 'rails_helper'

RSpec.describe "socioeduk/doc_recepcoes/edit", type: :view do
  before(:each) do
    @socioeduk_doc_recepcao = assign(:socioeduk_doc_recepcao, Socioeduk::DocRecepcao.create!(
      :doc_recepcao => "MyString"
    ))
  end

  it "renders the edit socioeduk_doc_recepcao form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_doc_recepcao_path(@socioeduk_doc_recepcao), "post" do

      assert_select "input[name=?]", "socioeduk_doc_recepcao[doc_recepcao]"
    end
  end
end
