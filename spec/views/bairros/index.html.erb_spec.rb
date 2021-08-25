require 'rails_helper'

RSpec.describe "bairros/index", type: :view do
  before(:each) do
    assign(:bairros, [
      Bairro.create!(
        :Cidade => "",
        :nome => "Nome"
      ),
      Bairro.create!(
        :Cidade => "",
        :nome => "Nome"
      )
    ])
  end

  it "renders a list of bairros" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
  end
end
