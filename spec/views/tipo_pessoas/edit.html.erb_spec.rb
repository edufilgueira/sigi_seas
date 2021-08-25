require 'rails_helper'

RSpec.describe "tipo_pessoas/edit", type: :view do
  before(:each) do
    @tipo_pessoa = assign(:tipo_pessoa, TipoPessoa.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit tipo_pessoa form" do
    render

    assert_select "form[action=?][method=?]", tipo_pessoa_path(@tipo_pessoa), "post" do

      assert_select "input[name=?]", "tipo_pessoa[descricao]"
    end
  end
end
