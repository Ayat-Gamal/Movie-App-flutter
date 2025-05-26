import 'package:flutter/material.dart';
import 'package:movie_app/common/widget/appbar/app_bar.dart';
import 'package:movie_app/presentation/search/widgets/search_field.dart';

import '../widgets/selectable_otion.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(title: Text("Search")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SearchField(),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableOption(
                  title: "Movie",
                  isSelected: true,
                  onTap: () => {},
                ),
                SizedBox(width:10 ,),
                SelectableOption(
                  title: "TV",
                  isSelected: false,
                  onTap: () => {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
