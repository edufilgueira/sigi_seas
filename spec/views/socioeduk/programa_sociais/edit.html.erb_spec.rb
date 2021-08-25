require 'rails_helper'

RSpec.describe "socioeduk/programa_sociais/edit", type: :view do
  before(:each) do
    @socioeduk_programa_social = assign(:socioeduk_programa_social, Socioeduk::ProgramaSocial.create!(
      :descricao => "MyString"
    ))
  end

  xit "renders the edit socioeduk_programa_social form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_programa_social_path(@socioeduk_programa_social), "post" do

      assert_select "input[name=?]", "socioeduk_programa_social[descricao]"
    end
  end
end
