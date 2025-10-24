import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_model.dart';

class ProfileCard extends StatelessWidget {
  final User user;
  final Function onSwipeOff;

  const ProfileCard({
    Key? key,
    required this.user,
    required this.onSwipeOff,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: _buildCard(context),
      childWhenDragging: Container(),
      onDragEnd: (details) {
        if (details.offset.dx.abs() > 100) {
          onSwipeOff();
        }
      },
      child: _buildCard(context),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(user.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.name}, ${user.age}',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headlineSmall,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Lives in New York', // Placeholder
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
