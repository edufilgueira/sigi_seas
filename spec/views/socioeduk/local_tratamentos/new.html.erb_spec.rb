require 'rails_helper'

RSpec.describe "socioeduk/local_tratamentos/new", type: :view do
  before(:each) do
    assign(:socioeduk_local_tratamento, Socioeduk::LocalTratamento.new(
      :descricao => "MyString",
      :status => false
    ))
  end

  it "renders new socioeduk_local_tratamento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_local_tratamentos_path, "post" do

      assert_select "input[name=?]", "socioeduk_local_tratamento[descricao]"

      assert_select "input[name=?]", "socioeduk_local_tratamento[status]"
    end
  end
end
