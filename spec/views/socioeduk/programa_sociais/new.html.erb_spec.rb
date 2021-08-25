require 'rails_helper'

RSpec.describe "socioeduk/programa_sociais/new", type: :view do
  before(:each) do
    assign(:socioeduk_programa_social, Socioeduk::ProgramaSocial.new(
      :descricao => "MyString"
    ))
  end

  xit "renders new socioeduk_programa_social form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_programa_sociais_path, "post" do

      assert_select "input[name=?]", "socioeduk_programa_social[descricao]"
    end
  end
end
