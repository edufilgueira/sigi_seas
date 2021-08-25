require 'rails_helper'

RSpec.describe "socioeduk/audiencias/new", type: :view do
  before(:each) do
    assign(:socioeduk_audiencia, Socioeduk::Audiencia.new(
      :socioeduk_processo => nil,
      :socioeduk_comarca => nil,
      :numero_processo => "MyString",
      :observacao => "MyText"
    ))
  end

  it "renders new socioeduk_audiencia form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_audiencias_path, "post" do

      assert_select "input[name=?]", "socioeduk_audiencia[socioeduk_processo_id]"

      assert_select "input[name=?]", "socioeduk_audiencia[socioeduk_comarca_id]"

      assert_select "input[name=?]", "socioeduk_audiencia[numero_processo]"

      assert_select "textarea[name=?]", "socioeduk_audiencia[observacao]"
    end
  end
end
