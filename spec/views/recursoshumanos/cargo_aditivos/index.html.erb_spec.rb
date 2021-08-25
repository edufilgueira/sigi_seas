# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "recursoshumanos/cargo_aditivos/index", type: :view do
  before(:each) do
    assign(:recursoshumanos_cargo_aditivos, [
             FactoryBot.create(:recursoshumanos_cargo_aditivo),
             FactoryBot.create(:recursoshumanos_cargo_aditivo)
           ])
  end

  xit "renders a list of recursoshumanos/cargo_aditivos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Operacao".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
