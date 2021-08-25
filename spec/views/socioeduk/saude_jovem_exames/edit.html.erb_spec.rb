require 'rails_helper'

RSpec.describe "socioeduk/saude_jovem_exames/edit", type: :view do
  before(:each) do
    @socioeduk_saude_jovem_exame = assign(:socioeduk_saude_jovem_exame, Socioeduk::SaudeJovemExame.create!(
      :socioeduk_saude_jovem => nil,
      :socioeduk_tipo_exame => nil
    ))
  end

  xit "renders the edit socioeduk_saude_jovem_exame form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_saude_jovem_exame_path(@socioeduk_saude_jovem_exame), "post" do

      assert_select "input[name=?]", "socioeduk_saude_jovem_exame[socioeduk_saude_jovem_id]"

      assert_select "input[name=?]", "socioeduk_saude_jovem_exame[socioeduk_tipo_exame_id]"
    end
  end
end
