require 'rails_helper'

RSpec.describe "socioeduk/visitante_jovens/new", type: :view do
  before(:each) do
    assign(:socioeduk_visitante_jovem, Socioeduk::VisitanteJovem.new(
      :socioeduk_visitante => nil,
      :socioeduk_jovem => nil,
      :socioeduk_tipo_parentesco => nil
    ))
  end

  xit "renders new socioeduk_visitante_jovem form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_visitante_jovens_path, "post" do

      assert_select "input[name=?]", "socioeduk_visitante_jovem[socioeduk_visitante_id]"

      assert_select "input[name=?]", "socioeduk_visitante_jovem[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_visitante_jovem[socioeduk_tipo_parentesco_id]"
    end
  end
end
