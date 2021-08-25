json.extract! biblioteca_livro, :id, :titulo, :sinopse, :biblioteca_autor_id, :biblioteca_local_id, :status, :created_at, :updated_at
json.url biblioteca_livro_url(biblioteca_livro, format: :json)
