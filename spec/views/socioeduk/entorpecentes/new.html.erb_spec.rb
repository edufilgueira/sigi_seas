require 'rails_helper'

RSpec.describe "socioeduk/entorpecentes/new", type: :view do
  before(:each) do
    assign(:socioeduk_entorpecente, Socioeduk::Entorpecente.new(
      :descricao => "MyString",
      :unidades_medida => nil,
      :status => false
    ))
  end

  xit "renders new socioeduk_entorpecente form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_entorpecentes_path, "post" do

      assert_select "input[name=?]", "socioeduk_entorpecente[descricao]"

      assert_select "input[name=?]", "socioeduk_entorpecente[unidades_medida_id]"

      assert_select "input[name=?]", "socioeduk_entorpecente[status]"
    end
  end
end
