# frozen_string_literal: true

class BibliotecaApplicationController < ApplicationController
  add_breadcrumb 'Biblioteca', :biblioteca_livros_path

  protected

  def load_defaults
    super
    @selected_system = 'Biblioteca'
    @navigation_partial = 'navigation_biblioteca'
  end
end
