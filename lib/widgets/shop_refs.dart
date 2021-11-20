import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:helping_hand/providers/user_information.dart';
import 'package:provider/provider.dart';
import '../screens/shop_details_screen.dart';

class ShopRefs extends StatefulWidget {
  const ShopRefs(this.ownerId);
  final String ownerId;
  @override
  _ShopRefsState createState() => _ShopRefsState();
}

class _ShopRefsState extends State<ShopRefs> {
  @override
  Widget build(BuildContext context) {
    // final shops =
    //     Provider.of<GetUserInfo>(context).fetchAndSetEmployerShops.shops;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('shops')
            .where('ownerId', isEqualTo: widget.ownerId)
            .snapshots(),
        builder:
            (ctx, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
                height: 140, child: Center(child: CircularProgressIndicator()));
          }
          final shops = snapshot.data.docs;
          if (shops.isEmpty) {
            return SizedBox(
              height: 50,
              child: Center(
                child: Text('No Shops Found'),
              ),
            );
          }
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 0,
            ),
            width: MediaQuery.of(context).size.width * 0.95,
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: shops.length,
              itemBuilder: (ctx, i) => Shopitem(
                  shopId: shops[i].id,
                  imageurl: shops[i]['shopImgUrl'],
                  shopName: shops[i]['shopName'],
                  shopType: shops[i]['shopType']),
            ),
          );
        });
  }
}

class Shopitem extends StatelessWidget {
  // const Shopitem({ Key? key }) : super(key: key);
  final String shopId;
  final String imageurl;
  final String shopName;
  final String shopType;

  Shopitem({
    @required this.imageurl,
    @required this.shopName,
    @required this.shopType,
    @required this.shopId,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        // padding: EdgeInsets.only(left: 3, right: 3, top: 0, bottom: 5),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        height: 120,
        width: 160,
        child: Stack(
          // fit: StackFit.expand,
          children: <Widget>[
            SizedBox(
              height: 120,
              width: 160,
              child: Image(
                image: NetworkImage(imageurl),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                padding: EdgeInsets.all(8),
                child: Text(
                  shopName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Positioned(
              // right: 10,
              left: 5,
              top: 5,
              // bottom: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(8),
                child: Text(
                  shopType,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShopDetailsScreen(
              providedShopId: shopId,
            ),
          ),
        );
      },
    );
  }
}
