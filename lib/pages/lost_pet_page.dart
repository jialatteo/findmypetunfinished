import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:untitled/pages/create_post_page.dart';
import 'package:untitled/pages/logged_in_page.dart';
import 'package:untitled/widgets/image_slider_carousel.dart';
import 'package:untitled/widgets/lost_pet_post.dart';
import 'package:untitled/widgets/search_textfield.dart';
import 'package:untitled/pages/account_page.dart';
import 'package:untitled/pages/chat_page.dart';
import 'package:untitled/pages/welcome_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//TODO: lost pet page
class LostPetPage extends StatefulWidget {
  static String route = "LostPetPage";
  const LostPetPage({Key? key}) : super(key: key);

  @override
  State<LostPetPage> createState() => _LostPetPageState();
}

class _LostPetPageState extends State<LostPetPage> {
  String meow =
      "MEOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOW";
  String woof =
      "WOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOF";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreatePostPage.route);
        },
        child: new Icon(Icons.add, size: 40.0),
        elevation: 8.0,
      ),
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 18, bottom: 10),
              child: SearchTextField(),
            ),
          ),
          Divider(
            height: 1,
            thickness: 2,
            color: Colors.pink,
          ),
          Expanded(
            child: ListView(
              children: [
                LostPetPost(
                  date: "27-May-22",
                  location: "Bukit Batok",
                  name: "Bob",
                  imageArray: [
                    'images/cat.jpg',
                    'images/catt.jpg',
                    'images/cattt.jpg'
                  ],
                  description: meow,
                  postalCode: '',
                  reward: -999,
                  exactLocation: '',
                  type: '',
                  isMale: true,
                ),
                LostPetPost(
                  reward: 9999999999999,
                  date: "25-May-22",
                  location: "Jurong East",
                  name: "Doge",
                  imageArray: [
                    'images/dog.jpg',
                    'images/dogg.jpg',
                    'images/doggg.jpg',
                    'images/dogggg.jpg',
                  ],
                  description: woof,
                  postalCode: '',
                  exactLocation: '',
                  type: '',
                  isMale: false,
                ),
                LostPetPost(
                  reward: -1,
                  date: "27-May-22",
                  location: "Bukit Batok",
                  name: "Bob",
                  imageArray: [
                    'images/cat.jpg',
                    'images/catt.jpg',
                    'images/cattt.jpg'
                  ],
                  description: meow,
                  postalCode: '',
                  exactLocation: '',
                  type: '',
                  isMale: false,
                ),
                LostPetPost(
                  reward: 20,
                  date: "25-May-22",
                  location: "Jurong East",
                  name: "Doge",
                  imageArray: [
                    'images/dog.jpg',
                    'images/dogg.jpg',
                    'images/doggg.jpg',
                    'images/dogggg.jpg'
                  ],
                  description: woof,
                  postalCode: '',
                  exactLocation: '',
                  type: '',
                  isMale: true,
                ),
                LostPetPost(
                  reward: 20,
                  date: "27-May-22",
                  location: "Bukit Batok",
                  name: "Bob",
                  imageArray: [
                    'images/cat.jpg',
                    'images/catt.jpg',
                    'images/cattt.jpg'
                  ],
                  description: meow,
                  postalCode: '',
                  exactLocation: '',
                  type: '',
                  isMale: true,
                ),
                LostPetPost(
                  reward: 20,
                  date: "25-May-22",
                  location: "Jurong East",
                  name: "Doge",
                  imageArray: [
                    'images/dog.jpg',
                    'images/dogg.jpg',
                    'images/doggg.jpg',
                    'images/dogggg.jpg'
                  ],
                  description: woof,
                  postalCode: '',
                  exactLocation: '',
                  type: '',
                  isMale: false,
                ),
                LostPetPost(
                  reward: 20,
                  date: "27-May-22",
                  location: "Bukit Batok",
                  name: "Bob",
                  imageArray: [
                    'images/cat.jpg',
                    'images/catt.jpg',
                    'images/cattt.jpg'
                  ],
                  description: meow,
                  postalCode: '',
                  exactLocation: '',
                  type: '',
                  isMale: true,
                ),
                LostPetPost(
                  reward: 20,
                  date: "25-May-22",
                  location: "Jurong East",
                  name: "Doge",
                  imageArray: [
                    'images/dog.jpg',
                    'images/dogg.jpg',
                    'images/doggg.jpg',
                    'images/dogggg.jpg'
                  ],
                  description: woof,
                  postalCode: '',
                  exactLocation: '',
                  type: '',
                  isMale: false,
                ),
                LostPetPost(
                  reward: 20,
                  date: "27-May-22",
                  location: "Bukit Batok",
                  name: "Bob",
                  imageArray: [
                    'images/cat.jpg',
                    'images/catt.jpg',
                    'images/cattt.jpg'
                  ],
                  description: meow,
                  postalCode: '',
                  exactLocation: '',
                  type: '',
                  isMale: true,
                ),
                LostPetPost(
                  reward: 9999,
                  date: "25-May-22",
                  location: "Jurong East",
                  name: "Doge",
                  imageArray: [
                    'images/dog.jpg',
                    'images/dogg.jpg',
                    'images/doggg.jpg',
                    'images/dogggg.jpg'
                  ],
                  description: woof,
                  postalCode: '',
                  exactLocation: '',
                  type: '',
                  isMale: false,
                ),
                LostPetPost(
                  reward: 20,
                  date: "27-May-22",
                  location: "Bukit Batok",
                  name: "Bob",
                  imageArray: [
                    'images/cat.jpg',
                    'images/catt.jpg',
                    'images/cattt.jpg'
                  ],
                  description: meow,
                  postalCode: '',
                  exactLocation: '',
                  type: '',
                  isMale: true,
                ),
                LostPetPost(
                  reward: 20,
                  date: "25-May-22",
                  location: "Jurong East",
                  name: "Doge",
                  imageArray: [
                    'images/dog.jpg',
                    'images/dogg.jpg',
                    'images/doggg.jpg',
                    'images/dogggg.jpg'
                  ],
                  description: woof,
                  postalCode: '',
                  exactLocation: '',
                  type: '',
                  isMale: true,
                ),
                LostPetPost(
                  reward: 20,
                  date: "27-May-22",
                  location: "Bukit Batok",
                  name: "Bob",
                  imageArray: [
                    'images/cat.jpg',
                    'images/catt.jpg',
                    'images/cattt.jpg'
                  ],
                  description: meow,
                  postalCode: '',
                  exactLocation: '',
                  type: '',
                  isMale: false,
                ),
                LostPetPost(
                  reward: 20,
                  date: "25-May-22",
                  location: "Jurong East",
                  name: "Doge",
                  imageArray: [
                    'images/dog.jpg',
                    'images/dogg.jpg',
                    'images/doggg.jpg',
                    'images/dogggg.jpg'
                  ],
                  description: woof,
                  postalCode: '',
                  exactLocation: '',
                  type: '',
                  isMale: true,
                ),
                LostPetPost(
                  reward: 20,
                  date: "27-May-22",
                  location: "Bukit Batok",
                  name: "Bob",
                  imageArray: [
                    'images/cat.jpg',
                    'images/catt.jpg',
                    'images/cattt.jpg'
                  ],
                  description: meow,
                  postalCode: '',
                  exactLocation: '',
                  type: '',
                  isMale: false,
                ),
                LostPetPost(
                  reward: 20,
                  date: "25-May-22",
                  location: "Jurong East",
                  name: "Doge",
                  imageArray: [
                    'images/dog.jpg',
                    'images/dogg.jpg',
                    'images/doggg.jpg',
                    'images/dogggg.jpg'
                  ],
                  description: woof,
                  postalCode: '',
                  exactLocation: '',
                  type: '',
                  isMale: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
