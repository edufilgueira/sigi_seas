require 'rails_helper'

RSpec.describe "socioeduk/tipo_vacinas/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_vacina = assign(:socioeduk_tipo_vacina, Socioeduk::TipoVacina.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_vacina form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_vacina_path(@socioeduk_tipo_vacina), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_vacina[descricao]"
    end
  end
end
