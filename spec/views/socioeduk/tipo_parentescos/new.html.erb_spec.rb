require 'rails_helper'

RSpec.describe "socioeduk/tipo_parentescos/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_parentesco, Socioeduk::TipoParentesco.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_parentesco form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_parentescos_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_parentesco[descricao]"
    end
  end
end
