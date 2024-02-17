import 'package:breaking_bad_app/data_layer/web_services/character_webservices.dart';

import '../model/characters.dart';


class CharactersRepository {

  late final CharacterWebServices characterWebServices ;

  CharactersRepository(this.characterWebServices);

  Future<Characters?> getAllCharacters() async {

    final characters = await characterWebServices.getAllCharacters();
    return characters;

  }
}