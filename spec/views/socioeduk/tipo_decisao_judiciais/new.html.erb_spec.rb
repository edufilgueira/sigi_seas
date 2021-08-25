require 'rails_helper'

RSpec.describe "socioeduk/tipo_decisao_judiciais/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_decisao_judicial, Socioeduk::TipoDecisaoJudicial.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_decisao_judicial form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_decisao_judiciais_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_decisao_judicial[descricao]"
    end
  end
end
