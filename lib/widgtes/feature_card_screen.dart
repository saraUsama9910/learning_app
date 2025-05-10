import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Ink.image(
              image: AssetImage(image),
              height: 180,
              fit: BoxFit.cover,
              child: InkWell(
                onTap: onTap,
              ),
            ),
            Container(
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                      color: Colors.black45,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
