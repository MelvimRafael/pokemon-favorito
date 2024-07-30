import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class FavoriteProvider with ChangeNotifier {
  List<Pokemon> _favorites = [];

  List<Pokemon> get favorites => _favorites;

  bool isFavorite(Pokemon pokemon) {
    return _favorites.contains(pokemon);
  }

  void addFavorite(Pokemon pokemon) {
    _favorites.add(pokemon);
    notifyListeners();
  }

  void removeFavorite(Pokemon pokemon) {
    _favorites.remove(pokemon);
    notifyListeners();
  }
}
