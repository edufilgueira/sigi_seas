require 'rails_helper'

RSpec.describe "socioeduk/doc_recepcoes/show", type: :view do
  before(:each) do
    @socioeduk_doc_recepcao = assign(:socioeduk_doc_recepcao, Socioeduk::DocRecepcao.create!(
      :doc_recepcao => "Doc Recepcao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Doc Recepcao/)
  end
end
