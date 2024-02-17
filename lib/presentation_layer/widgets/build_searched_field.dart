import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';
import '../../data_layer/model/results.dart';

class BuildSearchedField extends StatefulWidget {
   List<Result> ?results;
   List<Result>? searchedForCharacters;
   TextEditingController searchController = TextEditingController();
   BuildSearchedField({super.key, required this.results, required this.searchController, required this.searchedForCharacters});

  @override
  State<BuildSearchedField> createState() => _BuildSearchedFieldState();
}

class _BuildSearchedFieldState extends State<BuildSearchedField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.searchController,
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

   addSearchedForItemsToSearchedCharacters(String searchedCharacter) {
      widget.searchedForCharacters = widget.results
         ?.where((element) =>
         element.name.toLowerCase().startsWith(searchedCharacter))
         .toList();
     setState(() {});
   }
}


