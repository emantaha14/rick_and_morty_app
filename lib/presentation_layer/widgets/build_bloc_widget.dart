import 'package:breaking_bad_app/presentation_layer/widgets/show_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/characters_cubit.dart';
import '../../data_layer/model/results.dart';
import 'build_loaded_list_widgets.dart';

class BuildBlocWidget extends StatelessWidget {
  List<Result>? results;
  List<Result>? searchedForCharacters;
  TextEditingController searchController = TextEditingController();

  BuildBlocWidget(
      {super.key,
      required this.results,
      required this.searchedForCharacters,
      required this.searchController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          results = state.characters.results;
          if (results == null) {
            BlocProvider.of<CharactersCubit>(context).getAllCharacters(null);
            return const ShowLoadingIndicator();
          }
          return BuildLoadedListWidgets(
            allCharacters: results,
            searchController: searchController,
            searchedForCharacters: searchedForCharacters,
          );
        } else {
          return const ShowLoadingIndicator();
        }
      },
    );
  }
}
