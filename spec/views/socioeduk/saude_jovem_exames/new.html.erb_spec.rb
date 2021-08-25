require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_exames/new", type: :view do
  before(:each) do
    assign(:socioeduk_saude_jovem_exame, Socioeduk::SaudeJovemExame.new(
      :socioeduk_saude_jovem => nil,
      :socioeduk_tipo_exame => nil
    ))
  end

  xit "renders new socioeduk_saude_jovem_exame form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_saude_jovem_exames_path, "post" do

      assert_select "input[name=?]", "socioeduk_saude_jovem_exame[socioeduk_saude_jovem_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_exame[socioeduk_tipo_exame_id]"
    end
  end
end
