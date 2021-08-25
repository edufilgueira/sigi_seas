require 'rails_helper'

RSpec.describe "socioeduk/local_tratamentos/edit", type: :view do
  before(:each) do
    @socioeduk_local_tratamento = assign(:socioeduk_local_tratamento, Socioeduk::LocalTratamento.create!(
      :descricao => "MyString",
      :status => false
    ))
  end

  it "renders the edit socioeduk_local_tratamento form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_local_tratamento_path(@socioeduk_local_tratamento), "post" do

      assert_select "input[name=?]", "socioeduk_local_tratamento[descricao]"

      assert_select "input[name=?]", "socioeduk_local_tratamento[status]"
    end
  end
end
