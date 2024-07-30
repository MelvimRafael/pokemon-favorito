import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorite_provider.dart';
import '../widgets/pokemon_list_item.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Favoritos'),
            SizedBox(width: 8), // Espaçamento entre o texto e o contador
            if (favoriteProvider.favorites.isNotEmpty)
              Text(
                '(${favoriteProvider.favorites.length})',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
      body: favoriteProvider.favorites.isEmpty
          ? Center(child: Text('Não existe pokémon favorito!'))
          : ListView.builder(
              itemCount: favoriteProvider.favorites.length,
              itemBuilder: (ctx, i) =>
                  PokemonListItem(pokemon: favoriteProvider.favorites[i]),
            ),
    );
  }
}
