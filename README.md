# Zeus App

## API (90% Completo)

### Conta

1.  **POST**: api/conta/add
2.  **PUT**: api/conta/:id/sacar/:valor
3.  **PUT**: api/conta/:id/depositar/:valor 
4.  **PUT**: api/conta/:sacado/transferir/:beneficiado/:valor
5.  **GET**: api/conta/1/extrato


### Cliente

1.  **POST**: api/cliente/add
2.  **GET**: api/cliente/perfil

### login dados

URL: **POST***: localhost:[porta]/token

formato: x-www-form-urlencoded

username: [user]
password: [pass]
grant_type: password

### App (10% Completo)

AppCliente (Angular 7)

### Documentação

./wink.com/html-docs/index.html