import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class RateUs extends StatefulWidget {
  // const RateUs({ Key? key }) : super(key: key);

  @override
  _RateUsState createState() => _RateUsState();
}

class _RateUsState extends State<RateUs> {
  var ratingcontroller = TextEditingController();
  double rating;
  @override
  void initState() {
    ratingcontroller.text = "3.0";
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Rate us EVERYONE!'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Please Rate us here:",
                style: GoogleFonts.lora(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RatingBar.builder(
                allowHalfRating: true,
                initialRating: 3,
                minRating: 1,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (r) {
                  setState(() {
                    rating = r;
                  });
                },
                unratedColor: Colors.white,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Rating: $rating",
                style: GoogleFonts.lora(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Also give your valuable feedback:",
                style: GoogleFonts.lora(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Feedback',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(
                      10,
                    ),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(
                      10,
                    ),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(
                      10,
                    ),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(
                      10,
                    ),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                maxLines: 9,
                minLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
