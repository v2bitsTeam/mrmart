import 'package:mr_mart/ui/message_2/models/user_model.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final User currentUser = User(
    id: 0,
    name: 'Giant Food Store',
    imageUrl: 'assets/images/notification/notification_food1.png');

// USERS
final User greg = User(
    id: 1,
    name: 'Stop & Shop.',
    imageUrl: 'assets/images/notification/notification_food6.png');
final User james = User(
    id: 2,
    name: 'Hy-Sophia Vee',
    imageUrl: 'assets/images/notification/notification_food4.png');
final User john = User(
    id: 3,
    name: 'Giant Food Store',
    imageUrl: 'assets/images/notification/notification_food3.png');
final User olivia = User(
    id: 4,
    name: 'Wegmans',
    imageUrl: 'assets/images/notification/notification_food1.png');
final User sam = User(
    id: 5,
    name: 'Hy-Vee Food Stores',
    imageUrl: 'assets/images/notification/notification_food6.png');
final User sophia = User(
    id: 6,
    name: 'Sophia',
    imageUrl: 'assets/images/notification/notification_food4.png');
final User steven = User(
    id: 7,
    name: 'Steven',
    imageUrl: 'assets/images/notification/notification_food5.png');

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '12.02 am',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '12.02 am',
    text: 'Contrary to popular belief lorem....',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Contrary to popular belief lorem....',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Contrary to popular belief lorem....',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'Contrary to popular belief lorem....',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'Contrary to popular belief lorem....',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Contrary to popular belief lorem....',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best supper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];
