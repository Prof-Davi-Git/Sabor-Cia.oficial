# Sabor & Cia — Banco de Dados (atividade prática)

## O que foi acrescentado em 16/11/2026?

| Arquivo | Para que serve |
| --- | --- |
| `banco-de-dados/sabor_cia.sql` | Cria no MySQL as tabelas `usuarios`, `receitas`, `favoritos` e `comentarios` e inclui cinco usuários fictícios. |
| `frontend/dados/usuarios.json` | Contém os mesmos cinco usuários de exemplo, com uma senha padrão de teste. |
| `frontend/js/app.js` (modificado) | Agora consulta o JSON no login; mantém o cadastro e as demais funcionalidades do site. |
| `README.md` (novo) | Este guia simples para localizar as alterações. |

## Testar o login de demonstração

1. Abra o site por **HTTP/HTTPS**, por exemplo usando o servidor local já presente em `backend/server-local.js` ou uma publicação web.
2. Entre na página **Entrar**.
3. Digite **ana@saborcia.exemplo** e a senha **sabor123**.
4. Clique em **Entrar**. Outros quatro e-mails de teste estão em `frontend/dados/usuarios.json`.

**Como funciona?** A página `frontend/pages/login.html` já possui o formulário. O JavaScript `frontend/js/app.js` lê o arquivo `frontend/dados/usuarios.json` e procura o e-mail e a senha. Não é necessário editar o HTML.

**Cadastro existente:** as contas novas continuam sendo criadas no navegador, como antes. O JSON é uma lista fixa de usuários fictícios e não recebe esses cadastros automaticamente.

## Como testar o SQL no VSCode

1. Abra `banco-de-dados/sabor_cia.sql`.
2. Execute os comandos em uma conexão MySQL que já esteja configurada.
3. Execute `SHOW TABLES;` e `SELECT id, nome, email FROM usuarios;`.
4. Confira as quatro tabelas e os cinco usuários.

## Atenção

- O **MySQL e o JSON não estão conectados**. O arquivo JSON é uma cópia manual de dados de exemplo.
- O login com JSON é **apenas uma simulação escolar**. O JSON é público: não coloque nomes reais, e-mails reais ou senhas usadas em outros serviços.
- O SQL tem a coluna `senha_hash` para uma futura aplicação real, mas não guarda a senha padrão do JSON.
- Para contas reais e dados compartilhados entre dispositivos, será necessário um back-end/serviço de autenticação.
- Não foram alterados estilos CSS, páginas HTML, imagens, receitas, favoritos ou comentários.

### Onde procurar no código?

Em `frontend/js/app.js`, procure pelo comentário **ATUALIZAÇÃO 16/11** para encontrar o código novo.
