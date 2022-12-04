# App de listagem de personagens de Rick and Morty

Aplicação produzida como teste prático, utilizando a API pública da série Rick and Morty [https://rickandmortyapi.com/](https://rickandmortyapi.com/).

## Projeto

Aplicação para listar os personagens da série Rick and Morty, com funcionalidades relacionadas a filtragem e detalhamento de informações dos mesmos. No app é possível combinar filtros e encontrar o personagem que deseja ou até mesmo buscá-lo diretamente pelo nome.

## Tecnologias
#### Framework - Flutter: 3.3.8
documentação: https://docs.flutter.dev

#### Linguagem - Dart: 2.18.4
documentação: https://dart.dev/guides

#### Bibliotecas
##### - mobx: ^2.1.3
Utilizada para gerência de estados da aplicação.
Em conjunto com: flutter_mobx e mobx_codegen.
documentação: https://pub.dev/packages/mobx

##### - flutter_modular: ^5.0.3
Utilizada para Injeção de depêndencias e controle de rotas da aplicação.
Em conjunto com: modular_core, build_runner e modular_test.
documentação: https://pub.dev/packages/flutter_modular

##### - dio: ^4.0.6
Utilizada para requisições https.
documentação: https://pub.dev/packages/dio

##### - pull_to_refresh: ^2.0.0
Utilizada para recarregar a página com dados atualizados da API.
documentação: https://pub.dev/packages/pull_to_refresh

##### - ft_cli: ^0.1.8+8
Utilizada para geração automática da estrutura do Clean Architecture. Foi desenvolvida por ex-colegas meus.
documentação: https://pub.dev/packages/ft_cli

## Como rodar

Usando VSCode:
- Deve ter instalado as versões citadas do Dart e do Flutter;
- Deve ter instalado as extensões do Dart e do Flutter no VSCode;
- Clonar o projeto;
- Abrir o projeto no editor e rodar no terminal o comando:
```bash
flutter pub get
```
- Escolher o dispositivo: se for mobile, deve ter o emulador ou dispositivo físico conectados. Consulte rodando no terminal o comando:
```bash
flutter devices
```
- O projeto também é compatível com navegadores web.
- Rodar no terminal o comando:
```bash
flutter run
```

### Dispositivos testados
- Smatphone Xiaomi mi 9t pro;
- Emulador Android Nexus 5 com android 11;
- Google Chrome;
- Microsoft Edge.
