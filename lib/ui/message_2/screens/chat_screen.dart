import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/ui/checkout/cart_summary/cart_summary_screen.dart';
import 'package:mr_mart/ui/notification/notification_screen.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import '../models/message_model.dart';
import '../models/user_model.dart';
import 'package:flutter_svg/svg.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Widget _buildMessageComposer() {
    return Container(
      height: 70.0,
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: kBlueTextColor,
                borderRadius: BorderRadius.circular(50.0)),
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              iconSize: 25.0,
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextField(
            cursorColor: Colors.black,
            onChanged: (value) {},
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: 'Send a message ...',
              border: InputBorder.none,
            ),
          )),
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: kBlueTextColor,
                borderRadius: BorderRadius.circular(50.0)),
            alignment: Alignment.center,
            child: InkWell(
              child: SvgPicture.asset(
                'assets/icons/navigation_white.svg',
                height: Dimension.size20,
              ),
              onTap: () {
                // function
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message, bool isMe) {
    final msg = Container(
      width: MediaQuery.of(context).size.width * 0.75,
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0, right: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: isMe ? kChatMeColor : kChatOtherColor,
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message.time,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: isMe
                    ? Colors.white.withOpacity(.5)
                    : kChatOtherTextColor.withOpacity(.5),
              )),
          SizedBox(height: 8.0),
          Text(
            message.text,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: isMe ? Colors.white : kChatOtherTextColor,
            ),
          ),
        ],
      ),
    );

    if (isMe) return msg;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        msg,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/header.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: InkWell(
              child: SvgPicture.asset('assets/icons/cart_white.svg'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartSummaryScreen()),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: InkWell(
              child: SvgPicture.asset('assets/icons/notification.svg'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 0,
              ),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        title: Center(
          child: Text(
            widget.user.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
