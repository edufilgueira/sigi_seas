json.extract! biblioteca_emprestimo, :id, :biblioteca_livro, :pessoa_id, :status, :data, :nota, :usuario_id, :created_at, :updated_at
json.url biblioteca_emprestimo_url(biblioteca_emprestimo, format: :json)
