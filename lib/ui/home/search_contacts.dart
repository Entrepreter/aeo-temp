import 'package:aeo_logic/utils/colors_helper.dart';
import 'package:aeo_logic/utils/no_glow.dart';
import 'package:flutter/material.dart';

const String TAG = "my_hero";

class SearchDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: TAG,
      child: Card(
        margin: EdgeInsets.zero,
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: createSearchField(),
          ),
          body: createContactsList(),
        ),
      ),
    );
  }

  Widget createContactsList() {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView.separated(
        physics: ClampingScrollPhysics(),

        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (_, i) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: kPrimaryColor.withOpacity(0.2),
            ),
            title: Text("Sir James"),
            subtitle: Text("+12345678900"),
            trailing: FlatButton(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              onPressed: () {},
              child: Text(i % 2 == 0 ? "Invited" : "Invite"),
              color: i % 2 == 0 ? accentColor : kPrimaryColor,
              textColor: Colors.white,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 16,
        ),
      ),
    );
  }

  TextField createSearchField() {
    return TextField(
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
          fillColor: textFieldBgColor,
          filled: true,
          isDense: true,
          hintText: "Search Contacts",
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          suffixIcon: Icon(Icons.search)),
    );
  }
}
