import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data_layer/model/characters.dart';
import '../data_layer/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository characterRepository;

  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  Future<void> getAllCharacters(String? text) async {
    var charactersResponse = await characterRepository.getAllCharacters();
    if (text != null && text.isNotEmpty) {
      charactersResponse?.results = charactersResponse.results
          .where((element) => element.name.contains(text) ?? false)
          .toList();
    }
    emit(CharactersLoaded(charactersResponse!));
  }
}
