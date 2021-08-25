require 'rails_helper'

RSpec.describe "socioeduk/ocorrencias/index", type: :view do
  before(:each) do
    assign(:socioeduk_ocorrencias, [
      Socioeduk::Ocorrencia.create!(
        :nome => "Nome",
        :descricao => "Descricao",
        :tipo_ocorrencia => nil
      ),
      Socioeduk::Ocorrencia.create!(
        :nome => "Nome",
        :descricao => "Descricao",
        :tipo_ocorrencia => nil
      )
    ])
  end

  xit "renders a list of socioeduk/ocorrencias" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
