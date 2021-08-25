require 'rails_helper'

RSpec.describe "socioeduk/tipo_exames/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_exame, Socioeduk::TipoExame.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_exame form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_exames_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_exame[descricao]"
    end
  end
end
