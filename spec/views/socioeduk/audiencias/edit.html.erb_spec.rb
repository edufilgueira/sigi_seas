require 'rails_helper'

RSpec.describe "socioeduk/audiencias/edit", type: :view do
  before(:each) do
    @socioeduk_audiencia = assign(:socioeduk_audiencia, Socioeduk::Audiencia.create!(
      :socioeduk_processo => nil,
      :socioeduk_comarca => nil,
      :numero_processo => "MyString",
      :observacao => "MyText"
    ))
  end

  it "renders the edit socioeduk_audiencia form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_audiencia_path(@socioeduk_audiencia), "post" do

      assert_select "input[name=?]", "socioeduk_audiencia[socioeduk_processo_id]"

      assert_select "input[name=?]", "socioeduk_audiencia[socioeduk_comarca_id]"

      assert_select "input[name=?]", "socioeduk_audiencia[numero_processo]"

      assert_select "textarea[name=?]", "socioeduk_audiencia[observacao]"
    end
  end
end
