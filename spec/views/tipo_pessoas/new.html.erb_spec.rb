require 'rails_helper'

RSpec.describe "tipo_pessoas/new", type: :view do
  before(:each) do
    assign(:tipo_pessoa, TipoPessoa.new(
      :descricao => "MyString"
    ))
  end

  it "renders new tipo_pessoa form" do
    render

    assert_select "form[action=?][method=?]", tipo_pessoas_path, "post" do

      assert_select "input[name=?]", "tipo_pessoa[descricao]"
    end
  end
end
