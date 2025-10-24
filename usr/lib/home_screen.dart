import 'package:flutter/material.dart';
import 'user_model.dart';
import 'profile_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<User> _users = [
    User(name: 'Alice', age: 25, imageUrl: 'assets/images/user1.jpg'),
    User(name: 'Barbara', age: 22, imageUrl: 'assets/images/user2.jpg'),
    User(name: 'Catherine', age: 28, imageUrl: 'assets/images/user3.jpg'),
    User(name: 'Diana', age: 24, imageUrl: 'assets/images/user4.jpg'),
    User(name: 'Eleanor', age: 26, imageUrl: 'assets/images/user5.jpg'),
  ];

  void _removeTopCard() {
    setState(() {
      if (_users.isNotEmpty) {
        _users.removeAt(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Your Match'),
        backgroundColor: Colors.pink[300],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _users.isNotEmpty
                ? Stack(
                    alignment: Alignment.center,
                    children: _users.reversed.map((user) {
                      return ProfileCard(
                        user: user,
                        onSwipeOff: () {
                          _removeTopCard();
                        },
                      );
                    }).toList(),
                  )
                : Center(
                    child: Text(
                      'No more profiles',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
          ),
          _buildBottomButtons(),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconButton(Icons.replay, Colors.amber, () {}),
          _buildIconButton(Icons.close, Colors.red, _removeTopCard),
          _buildIconButton(Icons.star, Colors.blue, () {}),
          _buildIconButton(Icons.favorite, Colors.green, _removeTopCard),
          _buildIconButton(Icons.bolt, Colors.purple, () {}),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Color color, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: IconButton(
          icon: Icon(icon, color: color, size: 30),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
