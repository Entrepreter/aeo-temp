import 'package:aeo_logic/ui/home/search_contacts.dart';
import 'package:aeo_logic/utils/colors_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _options = {
    "Bank": Icons.food_bank_outlined,
    "TopUp": Icons.payment,
    "QR Code": Icons.qr_code,
    "Nearby": Icons.near_me
  };
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Send Money",
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Select Option",
              style:
                  Theme.of(context).textTheme.headline6.copyWith(fontSize: 14),
            ),
            buildPaymentOptions(),
            SizedBox(
              height: 16,
            ),
            buildRecentReceipts(context),
            SizedBox(
              height: 16,
            ),
            Hero(
              tag: TAG,
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add New Contact",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      createSearchField(context),
                      Flexible(child: createContactsList())
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView createContactsList() {
    return ListView.separated(
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 8),
      // shrinkWrap: true,
      itemCount: 10,
      shrinkWrap: true,
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
    );
  }

  TextField createSearchField(context) {
    return TextField(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => SearchDetailsPage()));
      },
      cursorColor: kPrimaryColor,
      readOnly: true,
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

  Card buildRecentReceipts(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recent Receipts",
              style:
                  Theme.of(context).textTheme.headline6.copyWith(fontSize: 14),
            ),
            SizedBox(
              height: 16,
            ),
            buildRecentReceipients()
          ],
        ),
      ),
    );
  }

  SizedBox buildRecentReceipients() {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 8),
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: kPrimaryColor.withOpacity(0.2),
                radius: 28,
              ),
              Text("Michael")
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 16,
        ),
      ),
    );
  }

  GridView buildPaymentOptions() {
    return GridView.count(
      padding: EdgeInsets.symmetric(vertical: 8),
      shrinkWrap: true,
      crossAxisCount: 4,
      children: _options.keys.map((e) {
        return buildCreateOption(e, _options[e]);
      }).toList(),
    );
  }

  Widget buildCreateOption(String title, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: kPrimaryColor,
            size: 24,
          ),
          SizedBox(
            height: 4,
          ),
          Text("$title"),
        ],
      ),
    );
  }
}
