require 'rails_helper'

RSpec.describe "urlbm/mapas/new", type: :view do
  before(:each) do
    assign(:urlbm_mapa, Urlbm::Mapa.new(
      :num_processo => "MyString",
      :responsavel => "MyString",
      :telefone => "MyString",
      :data_ocorrencia => "MyString",
      :data_admissao => "MyString",
      :data_nascimento => "MyString",
      :data_judicial => "MyString",
      :reincidente => false,
      :idade => "MyString",
      :bo_mapa => "MyString",
      :obs => "MyString",
      :socioeduk_jovem_recepcao => nil,
      :socioeduk_jovens => nil,
      :urlbm_ato_infracional => nil,
      :cidade => nil
    ))
  end

  it "renders new urlbm_mapa form" do
    render

    assert_select "form[action=?][method=?]", urlbm_mapas_path, "post" do

      assert_select "input[name=?]", "urlbm_mapa[num_processo]"

      assert_select "input[name=?]", "urlbm_mapa[responsavel]"

      assert_select "input[name=?]", "urlbm_mapa[telefone]"

      assert_select "input[name=?]", "urlbm_mapa[data_ocorrencia]"

      assert_select "input[name=?]", "urlbm_mapa[data_admissao]"

      assert_select "input[name=?]", "urlbm_mapa[data_nascimento]"

      assert_select "input[name=?]", "urlbm_mapa[data_judicial]"

      assert_select "input[name=?]", "urlbm_mapa[reincidente]"

      assert_select "input[name=?]", "urlbm_mapa[idade]"

      assert_select "input[name=?]", "urlbm_mapa[bo_mapa]"

      assert_select "input[name=?]", "urlbm_mapa[obs]"

      assert_select "input[name=?]", "urlbm_mapa[socioeduk_jovem_recepcao_id]"

      assert_select "input[name=?]", "urlbm_mapa[socioeduk_jovens_id]"

      assert_select "input[name=?]", "urlbm_mapa[urlbm_ato_infracional_id]"

      assert_select "input[name=?]", "urlbm_mapa[cidade_id]"
    end
  end
end
