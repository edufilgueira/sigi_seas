require 'rails_helper'

RSpec.describe "socioeduk/tipo_exames/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_exame = assign(:socioeduk_tipo_exame, Socioeduk::TipoExame.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_exame form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_exame_path(@socioeduk_tipo_exame), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_exame[descricao]"
    end
  end
end
