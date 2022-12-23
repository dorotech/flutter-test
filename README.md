# Projeto
OBS: Devido ao prazo em que tive para entregar o projeto, o aplicativo ficou bem corrido, com possibilidades de melhoria, especialmente com relação ao visual das telas (comecei fazendo pequenos pedaços em intervalos no trabalho, e foquei depois das 18 até o horário limite 23:59).
Algumas ideias deixarei com (*) representando ações que foram afetadas por causa da entrega

## Como padrão, comecei o desenvolvimento criando as pastas que pensei necessárias para o projeto quando fosse inicializa-lo, são essas:

### **/assets**: De inicio criei a pasta aqui para deixar vários arquivos SVG afim de deixar o aplicativo com uma cara moderna e amigável(*)
### **/core**: Aonde ficarão objetos necessários para a aplicação, como:
* Os dados do aplicativo; 
* Arquivos de cache; 
* Algumas strigns usadas em vários lugares na aplicação (Ideal seria deixar um arquivo em core com as strings mais utilizadas e um arquivo especifico em cada feature (*))
* Funções e Widgets que podem ser usados em toda a aplicação
## **/features**: Aqui estão todas as telas na aplicação, as pastas padrões são:
#### /controller: com os controllers da das telas responsáveis pelo gerenciamento de estado das telas
#### /repository: arquivos para fazer acesso aos dados que serão consumidos pelos controller e presenter
#### /presenter: telas e widgets em si
#### algumas telas podem ter mais pastas, como:
#### - /data: aonde ficarão objetos que somente aquele recurso deve consumir
#### - /componets: local aonde podem ficar alguns widgets ou recursos mais genéricos para a feature (*)

## test
- **/test** a pasta de test deve seguir as mesmas estruturas que a pasta de produção (/lib)]

Com as pastas criadas comecei a implementa-las, começando pela /core, com as classes que seriam necessárias para a aplicação
Em segundo momento, busquei criar algumas classes abstratas que seriam uteis em breve já criando seus mocks para testes
Em seguida, comecei desenvolvendo os testes da classe de controller, garantindo que suas funções estejam fazendo suas responsabilidades
Após os testes, comecei a realizar a criação das telas e testar as classes repositories na produção, felizmente funcionaram de primeira.

Para realizar o desafio tive a ajuda de algumas bibliotecas que costumo utilizar:
- Hive: Para cache, consigo salvar classes inteiras em cache de forma fácil, a utilizo muito para criar micro-frontends no meu trabalho.
- MobX: Gerencimento de estado das telas, fiz a implementação de forma rápida, sem utilizar muitos de seus recursos, poderia ter ficado melhor, em alguns lugares utilizei também o setState(*)
- http: Realizar conexões com a API
- path_provide: Utilizada para obter o diretório da aplicação no device para o Hive salvar a os objetos da forma como implementei 
- connectivity_plus: Verificar o device está com dados móveis ou Wi-Fi ativo
- material_design_icons_flutter: Icones
- test, mockito, faker: Auxiliar nos testes.
- flutter_native_splash: Criar uma tela nativa de splash screen básica
- flutter_launcher_icons: Adicionar logo no ícone ao aplicativo

### Para compilar 
- **web** pode-se user flutter run -d chrome
- **android** deixarei um apk na pasta raiz, caso não execute, pode rodar com flutter run --release 
 
Versão do Flutter utilizada: Flutter 3.3.10

