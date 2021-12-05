import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/providers/user_information.dart';
import 'package:helping_hand/widgets/newshop.dart';
import 'package:provider/provider.dart';

class ManageShops extends StatefulWidget {
  // const ManageShops({ Key? key }) : super(key: key);
  final String uname;
  ManageShops(this.uname);
  @override
  _ManageShopsState createState() => _ManageShopsState();
}

class _ManageShopsState extends State<ManageShops> {
  @override
  Widget build(BuildContext context) {
    final cUser = FirebaseAuth.instance.currentUser.uid;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('shops')
            .where('ownerId', isEqualTo: cUser)
            .snapshots(),
        builder:
            (ctx, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
                height: 140, child: Center(child: CircularProgressIndicator()));
          }
          final shops = snapshot.data.docs;

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Manage Shops',
                style: TextStyle(color: Colors.teal),
              ),
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                color: Colors.teal, //change your color here
              ),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.add_business_sharp),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        builder: (BuildContext context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: NewShop(widget.uname),
                          );
                        },
                      );
                    })
              ],
            ),
            body: shops.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/waiting.png',
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'No Shops Found !',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: shops.length,
                        itemBuilder: (ctx, i) => ManageShopItem(
                          shopImgUrl: shops[i]['shopImgUrl'],
                          shopType: shops[i]['shopType'],
                          shopId: shops[i].id,
                        ),
                      ),
                    ),
                  ),
          );
        });
  }
}

class ManageShopItem extends StatelessWidget {
  // const Shop({ Key? key }) : super(key: key);
  final String shopImgUrl;
  final String shopType;
  final String shopId;
  ManageShopItem({
    this.shopId,
    this.shopType,
    this.shopImgUrl,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> deleteShop() async {
      try {
        FirebaseFirestore.instance.collection('shops').doc(shopId).delete();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Shop Deleted')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to Delete Shop')),
        );
      }
    }

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(8),
      child: Container(
        height: 200,
        child: Stack(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Image(
                image: NetworkImage(shopImgUrl),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(0.9),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                child: Row(
                  children: [
                    Icon(
                      Icons.flag,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      shopType,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   top: 10,
            //   right: 10,
            //   child: CircleAvatar(
            //     radius: 25,
            //     backgroundColor: Colors.white,
            //     child: IconButton(
            //       icon: Icon(Icons.edit),
            //       onPressed: () {},
            //     ),
            //   ),
            // ),
            Positioned(
              right: 10,
              bottom: 15,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.delete_outline_rounded),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Are you sure? '),
                      content: Text('Do you want to delete this Shop Profile?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            deleteShop();
                            Navigator.of(ctx).pop(true);
                          },
                          child: Text('YES!'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop(false);
                          },
                          child: Text('NO!'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
