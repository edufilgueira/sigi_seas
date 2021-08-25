require 'rails_helper'

RSpec.describe "biblioteca/locais/index", type: :view do
  before(:each) do
    assign(:biblioteca_locais, [
      Biblioteca::Local.create!(
        :nome => "Nome"
      ),
      Biblioteca::Local.create!(
        :nome => "Nome"
      )
    ])
  end

  xit "renders a list of biblioteca/locais" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
  end
end
