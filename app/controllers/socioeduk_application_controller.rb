# frozen_string_literal: true

class SocioedukApplicationController < ApplicationController
  add_breadcrumb 'Socioeduk', :socioeduk_jovens_path

  protected

  def load_defaults
    super
    @selected_system = 'Socioeduk'
    @navigation_partial = 'navigation_socioeduk'
  end
end
