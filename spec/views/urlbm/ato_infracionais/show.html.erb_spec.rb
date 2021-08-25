require 'rails_helper'

RSpec.describe "urlbm/ato_infracionais/show", type: :view do
  before(:each) do
    @urlbm_ato_infracional = assign(:urlbm_ato_infracional, Urlbm::AtoInfracional.create!(
      :tipo => "Tipo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Tipo/)
  end
end
