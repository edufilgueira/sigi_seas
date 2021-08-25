require 'rails_helper'

RSpec.describe "socioeduk/saude_jovens_tipo_parentescos/new", type: :view do
  before(:each) do
    assign(:socioeduk_saude_jovens_tipo_parentesco, Socioeduk::SaudeJovensTipoParentesco.new(
      :socioeduk_saude_jovem => nil,
      :socioeduk_tipo_parentesco => nil
    ))
  end

  xit "renders new socioeduk_saude_jovens_tipo_parentesco form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_saude_jovens_tipo_parentescos_path, "post" do

      assert_select "input[name=?]", "socioeduk_saude_jovens_tipo_parentesco[socioeduk_saude_jovem_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovens_tipo_parentesco[socioeduk_tipo_parentesco_id]"
    end
  end
end
