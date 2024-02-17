import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../business_logic/characters_cubit.dart';
import '../../constants/my_colors.dart';
import '../../data_layer/model/results.dart';
import '../widgets/build_loaded_list_widgets.dart';
import '../widgets/build_no_internet_widget.dart';
import '../widgets/show_loading_indicator.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<Result>? searchedForCharacters;
  bool isSearching = false;
  final _searchController = TextEditingController();
  List<Result>? results;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: isSearching ? buildSearchedField() : _buildAppBarTitle(),
        actions: _buildAppBarAction(),
        leading: isSearching
            ? const BackButton(
                color: MyColors.myGrey,
              )
            : Container(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return buildBlocWidget();
          } else {
            return const BuildNoInternet();
          }
        },
        child: const ShowLoadingIndicator(),
      ),
    );
  }

  Widget buildSearchedField() {
    return TextField(
      controller: _searchController,
      cursorColor: MyColors.myGrey,
      decoration: const InputDecoration(
        hintText: 'find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18),
      ),
      style: const TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: (searchedCharacter) =>
          addSearchedForItemsToSearchedCharacters(searchedCharacter),
    );
  }

  void addSearchedForItemsToSearchedCharacters(String searchedCharacter) {
    searchedForCharacters = results
        ?.where((element) =>
            element.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarAction() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.clear,
              color: MyColors.myGrey,
            ))
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(Icons.search),
          color: MyColors.myGrey,
        )
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

  Widget buildBlocWidget() {
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
            searchController: _searchController,
            searchedForCharacters: searchedForCharacters,
          );
        } else {
          return const ShowLoadingIndicator();
        }
      },
    );
  }

  Widget _buildAppBarTitle() {
    return const Text(
      'Characters',
      style: TextStyle(color: MyColors.myGrey),
    );
  }
}
