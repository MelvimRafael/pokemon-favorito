import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/pokemon_provider.dart';
import '../providers/favorite_provider.dart';
import '../widgets/pokemon_list_item.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokemonProvider>(context);

    return DefaultTabController(
      length: 2, // Número de abas
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pokémon App'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Pokémons'),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Favoritos'),
                    SizedBox(width: 8), // Espaço entre texto e contador
                    Consumer<FavoriteProvider>(
                      builder: (ctx, favoriteProvider, child) {
                        return Text(
                          '(${favoriteProvider.favorites.length})',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Aba com a lista de Pokémons
            pokemonProvider.isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: pokemonProvider.pokemons.length,
                    itemBuilder: (ctx, i) =>
                        PokemonListItem(pokemon: pokemonProvider.pokemons[i]),
                  ),
            // Aba com a lista de Favoritos
            Consumer<FavoriteProvider>(
              builder: (ctx, favoriteProvider, child) {
                return favoriteProvider.favorites.isEmpty
                    ? Center(child: Text('Não existe pokémon favorito!'))
                    : ListView.builder(
                        itemCount: favoriteProvider.favorites.length,
                        itemBuilder: (ctx, i) => PokemonListItem(
                            pokemon: favoriteProvider.favorites[i]),
                      );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pokemonProvider.fetchPokemons();
          },
          child: Icon(Icons.refresh), // Ícone de atualização
        ),
      ),
    );
  }
}
