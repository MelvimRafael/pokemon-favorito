import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pokemon.dart';
import '../providers/favorite_provider.dart';

class PokemonListItem extends StatelessWidget {
  final Pokemon pokemon;

  PokemonListItem({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return ListTile(
      contentPadding: EdgeInsets.all(8.0),
      leading: CircleAvatar(
        backgroundImage:
            pokemon.imageUrl.isNotEmpty ? NetworkImage(pokemon.imageUrl) : null,
        radius: 30,
        backgroundColor: Colors.grey[200],
      ),
      title: Text(
        pokemon.name,
        style: TextStyle(
          fontWeight: FontWeight.bold, // Nome em negrito
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Tipo: ${pokemon.type}'),
          SizedBox(width: 10), // Espaçamento entre os elementos
          Text('Altura: ${pokemon.height / 10} m'),
          SizedBox(width: 10), // Espaçamento entre os elementos
          Text('Peso: ${pokemon.weight / 10} kg'),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          favoriteProvider.isFavorite(pokemon)
              ? Icons.favorite
              : Icons.favorite_border,
          color: favoriteProvider.isFavorite(pokemon) ? Colors.red : null,
        ),
        onPressed: () {
          if (favoriteProvider.isFavorite(pokemon)) {
            favoriteProvider.removeFavorite(pokemon);
          } else {
            favoriteProvider.addFavorite(pokemon);
          }
        },
      ),
    );
  }
}
