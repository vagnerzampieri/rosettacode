# Run local

```bash
docker compose up -d
ruby main.rb
```

# Run console

```bash
bundle exec irb -I. -r app.rb
```

Browse to:

```
http://localhost:4567
```

# About the application

- rota de login
- rota que só pode ser acessada por usuário logado
- usuário
- pegar o evento de sign in
- analizar o evento (gerando um score)
- salvar o score
- lock se o score for alto

