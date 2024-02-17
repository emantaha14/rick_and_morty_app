import 'package:breaking_bad_app/constants/my_colors.dart';
import 'package:flutter/material.dart';

import '../../data_layer/model/results.dart';

class CharacterDetails extends StatelessWidget {
  final Result selectedCharacter;

  const CharacterDetails({super.key, required this.selectedCharacter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  characterInfo('Job : ', selectedCharacter.name),
                  buildDivider(315),
                  characterInfo('Appeared in : ', 'Rick and Morty'),
                  buildDivider(250),
                  characterInfo('Status : ',
                      selectedCharacter.status.toString().substring(7)),
                  buildDivider(290),
                  characterInfo('Species : ',
                      selectedCharacter.species.toString().substring(8)),
                  buildDivider(280),
                  selectedCharacter.type.isEmpty
                      ? Container()
                      : characterInfo('Type : ', selectedCharacter.type),
                  selectedCharacter.type.isEmpty
                      ? Container()
                      : buildDivider(300),
                  characterInfo('Gender : ',
                      selectedCharacter.gender.toString().substring(7)),
                  buildDivider(290),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 500,
            ),
          ]))
        ],
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          selectedCharacter.name,
          style: const TextStyle(
            color: MyColors.myWhite,
          ),
        ),
        background: Hero(
          tag: selectedCharacter.id,
          child: Image.network(
            selectedCharacter.image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
            text: title,
            style: const TextStyle(
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        TextSpan(
            text: value,
            style: const TextStyle(color: MyColors.myWhite, fontSize: 16))
      ]),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }
}
