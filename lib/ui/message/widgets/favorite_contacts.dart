import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/ui/message/screens/chat_screen.dart';
import 'package:mr_mart/app_components/constants.dart';
import '../models/message_model.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        children: [
          Container(
            color: kBackgroundColor,
            height: 120.0,
            child: ListView.builder(
              itemCount: favorites.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        user: favorites[index],
                      ),
                    ),
                  ),
                  child: Container(
                    width: 87,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35.0,
                            backgroundImage:
                                AssetImage(favorites[index].imageUrl),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Flexible(
                            child: Text(
                              favorites[index].name,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultPadding,
                top: 10,
                right: kDefaultPadding,
                bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Chat",
                  textDirection: TextDirection.ltr,
                  style:
                      Theme.of(context).textTheme.headline1.copyWith(height: 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
