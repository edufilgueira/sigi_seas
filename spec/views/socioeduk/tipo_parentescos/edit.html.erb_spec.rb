require 'rails_helper'

RSpec.describe "socioeduk/tipo_parentescos/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_parentesco = assign(:socioeduk_tipo_parentesco, Socioeduk::TipoParentesco.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_parentesco form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_parentesco_path(@socioeduk_tipo_parentesco), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_parentesco[descricao]"
    end
  end
end
