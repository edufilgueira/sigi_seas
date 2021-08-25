require 'rails_helper'

RSpec.describe "socioeduk/tipo_decisao_judiciais/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_decisao_judicial = assign(:socioeduk_tipo_decisao_judicial, Socioeduk::TipoDecisaoJudicial.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_decisao_judicial form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_decisao_judicial_path(@socioeduk_tipo_decisao_judicial), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_decisao_judicial[descricao]"
    end
  end
end
