require 'rails_helper'

RSpec.describe "socioeduk/entorpecentes/edit", type: :view do
  before(:each) do
    @socioeduk_entorpecente = assign(:socioeduk_entorpecente, Socioeduk::Entorpecente.create!(
      :descricao => "MyString",
      :unidades_medida => nil,
      :status => false
    ))
  end

  xit "renders the edit socioeduk_entorpecente form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_entorpecente_path(@socioeduk_entorpecente), "post" do

      assert_select "input[name=?]", "socioeduk_entorpecente[descricao]"

      assert_select "input[name=?]", "socioeduk_entorpecente[unidades_medida_id]"

      assert_select "input[name=?]", "socioeduk_entorpecente[status]"
    end
  end
end
