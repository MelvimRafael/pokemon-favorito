import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/pokemon.dart';

class PokemonProvider with ChangeNotifier {
  List<Pokemon> _pokemons = [];
  bool _isLoading = false;

  List<Pokemon> get pokemons => _pokemons;
  bool get isLoading => _isLoading;

  Future<void> fetchPokemons() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=50'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        final List<Pokemon> loadedPokemons = [];

        for (var result in results) {
          final pokemonResponse = await http.get(Uri.parse(result['url']));
          final pokemonData = json.decode(pokemonResponse.body);
          loadedPokemons.add(Pokemon.fromJson(pokemonData));
        }

        _pokemons = loadedPokemons;
      }
    } catch (error) {
      print('Error fetching pokemons: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
