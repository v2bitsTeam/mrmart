import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/ui/message_2/widgets/favorite_contacts.dart';
import 'package:mr_mart/ui/message_2/widgets/recent_chats.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:shape_of_view/shape_of_view.dart';

class Message2Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchWidget(),
        Expanded(
          child: Container(
            child: Column(
              children: [
                FavoriteContacts(),
                RecentChats(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 0),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            bottom: kDefaultPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 6,
                child: TextField(
                  style: Theme.of(context).textTheme.headline5,
                  cursorColor: Colors.black,
                  inputFormatters: [],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kBackgroundColor,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25,
                      color: kSubTextColor,
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 14.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    border: InputBorder.none,
                    hintText: "Green apple",
                    hintStyle: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  child: ShapeOfView(
                    height: 50,
                    width: 50,
                    elevation: 0,
                    shape: RoundRectShape(
                      borderRadius: BorderRadius.circular(5),
                      borderColor: Colors.black, //optional
                      borderWidth: 0, //optional
                    ),
                    child: Container(
                      color: kSearchCLear_iconBG,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.clear,
                          size: 25,
                          color: kSearchCLear_icon,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    // clear function
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
