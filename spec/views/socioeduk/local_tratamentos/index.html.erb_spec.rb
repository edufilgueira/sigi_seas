require 'rails_helper'

RSpec.describe "socioeduk/local_tratamentos/index", type: :view do
  before(:each) do
    assign(:socioeduk_local_tratamentos, [
      Socioeduk::LocalTratamento.create!(
        :descricao => "Descricao",
        :status => false
      ),
      Socioeduk::LocalTratamento.create!(
        :descricao => "Descricao",
        :status => false
      )
    ])
  end

  it "renders a list of socioeduk/local_tratamentos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
