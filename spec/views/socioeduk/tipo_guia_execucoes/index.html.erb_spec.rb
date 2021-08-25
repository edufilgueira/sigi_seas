require 'rails_helper'

RSpec.describe "socioeduk/tipos/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_guia_execucoes, [
      Socioeduk::TipoGuiaExecucao.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoGuiaExecucao.create!(
        :descricao => "Descricao"
      )
    ])
  end

  xit "renders a list of socioeduk/tipos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
