import 'package:flutter/material.dart';

import '../../data_layer/model/results.dart';
import 'characters_item.dart';

class BuildCharacterList extends StatelessWidget {
  var allCharacters ;
   List<Result> ?searchedForCharacters;
   TextEditingController searchController = TextEditingController();
   BuildCharacterList({super.key,required this.allCharacters, required this.searchedForCharacters,required this.searchController});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 2 / 3),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: searchController.text.isEmpty
          ? allCharacters.length
          : searchedForCharacters?.length,
      itemBuilder: (context, index) {
        return CharactersItem(
          character: searchController.text.isEmpty
              ? allCharacters[index]
              : searchedForCharacters?[index],
        );
      },
    );
  }
}
