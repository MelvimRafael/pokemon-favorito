
---

# Pokémon App

O *Pokémon App* é um aplicativo desenvolvido em Flutter que permite aos usuários explorar uma lista de Pokémons, visualizar informações detalhadas sobre cada um e gerenciar suas preferências de favoritos. Utiliza a biblioteca provider para gerenciamento de estado e consome dados de uma API externa para obter informações sobre Pokémons.

## Funcionalidades

- *Exibição de Pokémons*: Navegue por uma lista de Pokémons, com a capacidade de visualizar informações detalhadas sobre cada um, como tipo, altura e peso.
- *Favoritar Pokémons*: Adicione Pokémons à lista de favoritos e visualize-os na aba "Favoritos".
- *Gerenciamento de Favoritos*: Acompanhe o número de Pokémons favoritados e visualize a lista de itens favoritados em uma aba dedicada.
- *Atualização de Dados*: Atualize a lista de Pokémons com um botão de atualização na interface principal.

## Estrutura do Projeto

- **HomeScreen**: Tela principal com duas abas, "Pokémons" e "Favoritos". A aba "Pokémons" exibe a lista de Pokémons e a aba "Favoritos" exibe os Pokémons favoritados.
- **FavoritesScreen**: Tela dedicada para visualizar todos os Pokémons que foram adicionados à lista de favoritos.
- **PokemonListItem**: Widget que exibe as informações de um Pokémon, incluindo uma foto circular, nome, tipo, altura e peso.
- **PokemonProvider e FavoriteProvider**: Providers que gerenciam o estado dos Pokémons e dos favoritos, respectivamente.

## Instalação

1. Clone o repositório:
   ```bash
   git clone https://github.com/MelvimRafael/pokemon-favorito.git
   ```


2. Navegue até o diretório do projeto:
   ```bash
   cd pokemon-app
   ```

3. Instale as dependências:
   ``` bash
   flutter pub get
   ```
   

4. Execute o aplicativo:
   ```bash
   flutter run
   ```

## Tecnologias Utilizadas

- *Flutter*: Framework para desenvolvimento de aplicativos móveis.
- *Provider*: Biblioteca para gerenciamento de estado no Flutter.
- *API Externa*: Utilizada para obter dados sobre Pokémons.

## Contribuição

Contribuições são bem-vindas! Se você encontrar algum bug ou tiver sugestões para melhorias, por favor, abra uma issue ou envie um pull request.



---
