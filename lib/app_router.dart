import 'package:breaking_bad_app/data_layer/model/results.dart';
import 'package:breaking_bad_app/presentation_layer/modules/character_details.dart';
import 'package:breaking_bad_app/presentation_layer/modules/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/characters_cubit.dart';
import 'constants/strings.dart';
import 'data_layer/repository/characters_repository.dart';
import 'data_layer/web_services/character_webservices.dart';

class AppRouter {
  late CharactersRepository characterRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    characterRepository = CharactersRepository(CharacterWebServices());
    charactersCubit = CharactersCubit(characterRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        final selectedCharacter = settings.arguments as Result;
        return MaterialPageRoute(builder: (context) =>  CharacterDetails(selectedCharacter: selectedCharacter),);
    }
    return null;
  }
}
