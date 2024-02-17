import 'package:flutter/cupertino.dart';

import '../../constants/my_colors.dart';
import '../../data_layer/model/results.dart';
import 'build_character_list.dart';

class BuildLoadedListWidgets extends StatelessWidget {
  var allCharacters ;
  List<Result> ?searchedForCharacters;
  TextEditingController searchController = TextEditingController();

   BuildLoadedListWidgets({super.key,required this.allCharacters, required this.searchedForCharacters, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [BuildCharacterList(allCharacters: allCharacters,searchController: searchController,
            searchedForCharacters: searchedForCharacters,)],
        ),
      ),
    );
  }
}
