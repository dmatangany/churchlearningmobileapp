import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/data/data.dart';
import '/screens/tutor_screen.dart';
import '/widgets/rating_stars.dart';

class BrowseModules extends StatelessWidget {
  const BrowseModules({Key? key}) : super(key: key);

  Widget _buildBrowseModules(BuildContext context) {
    resizeToAvoidBottomInset: false;
    return Column(
      children: tutors.map((thisTutor) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) =>
                      TutorScreen(tutor: thisTutor)),
            );
          },
          child: Container(
            height: 90,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3.0,
                  blurRadius: 6.0,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Hero(
                    tag: thisTutor.imageUrl!,
                    child: Image.asset(
                      thisTutor.imageUrl!,
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Wrap(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          thisTutor.name!,
                          style: const TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RatingStars(thisTutor.rating!),
                        const SizedBox(height: 12.0),
                        Text(
                          thisTutor.role!,
                          style: const TextStyle(
                            fontSize: 11.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    resizeToAvoidBottomInset: false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 10),
          child: Text(
            'Browse Modules By Tutor',
            style: GoogleFonts.cabin(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _buildBrowseModules(context),
      ],
    );
  }
}
