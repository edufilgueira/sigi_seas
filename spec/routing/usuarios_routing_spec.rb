# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::UsuariosController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'admin/usuarios').to route_to('admin/usuarios#index')
    end

    it 'routes to #new' do
      expect(get: 'admin/usuarios/new').to route_to('admin/usuarios#new')
    end

    it 'routes to #show' do
      expect(get: 'admin/usuarios/1').to route_to('admin/usuarios#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: 'admin/usuarios/1/edit').to route_to('admin/usuarios#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: 'admin/usuarios').to route_to('admin/usuarios#create')
    end

    it 'routes to #update via PUT' do
      expect(put: 'admin/usuarios/1').to route_to('admin/usuarios#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'admin/usuarios/1').to route_to('admin/usuarios#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'admin/usuarios/1').to route_to('admin/usuarios#destroy', id: '1')
    end
  end
end
