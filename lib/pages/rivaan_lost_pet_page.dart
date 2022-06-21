import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/create_post_page.dart';
import 'package:untitled/widgets/rivaan_lost_pet_post.dart';
import 'package:untitled/widgets/search_textfield.dart';

//TODO: lost pet page
class RLostPetPage extends StatefulWidget {
  static String route = "LostPetPage";
  const RLostPetPage({Key? key}) : super(key: key);

  @override
  State<RLostPetPage> createState() => _RLostPetPageState();
}

class _RLostPetPageState extends State<RLostPetPage> {
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (ctx, index) => Container(
              child: RLostPetPost(
                snap: snapshot.data!.docs[index].data(),
              ),
            ),
          );
        },
      ),
    );
    // )

    // Column(
    //   children: [
    //     SafeArea(
    //       child: Padding(
    //         padding: const EdgeInsets.only(left: 12, top: 18, bottom: 10),
    //         child: SearchTextField(),
    //       ),
    //     ),
    //     Divider(
    //       height: 1,
    //       thickness: 2,
    //       color: Colors.pink,
    //     ),
    //   ],
    // ),
    // );
  }
}
