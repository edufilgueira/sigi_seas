require 'rails_helper'

RSpec.describe "tipo_pessoas/index", type: :view do
  before(:each) do
    assign(:tipo_pessoas, [
      TipoPessoa.create!(
        :descricao => "Descricao"
      ),
      TipoPessoa.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of tipo_pessoas" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
