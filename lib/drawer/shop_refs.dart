import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'shop_details_screen.dart';

class ShopRefs extends StatefulWidget {
  const ShopRefs({key}) : super(key: key);

  @override
  _ShopRefsState createState() => _ShopRefsState();
}

class _ShopRefsState extends State<ShopRefs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            TextButton(
              child: Shopitem(
                imageurl:
                    'https://ichef.bbci.co.uk/news/976/cpsprodpb/8A13/production/_116574353_gettyimages-1229868118.jpg',
                shopName: 'Topshop',
                shopType: 'Sweets',
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopDetailsScreen(
                      imageurl:
                          'https://ichef.bbci.co.uk/news/976/cpsprodpb/8A13/production/_116574353_gettyimages-1229868118.jpg',
                      shopName: 'Topshop',
                      shopType: 'Sweets',
                    ),
                  ),
                );
              },
            ),
            TextButton(
              child: Shopitem(
                imageurl:
                    'https://imganuncios.mitula.net/shop_from_12_lacs_showroom_warehouse_rent_store_main_gate_shops_office_2750077626957635821.jpg',
                shopName: 'Outfitters',
                shopType: 'Clothes',
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopDetailsScreen(
                      imageurl:
                          'https://imganuncios.mitula.net/shop_from_12_lacs_showroom_warehouse_rent_store_main_gate_shops_office_2750077626957635821.jpg',
                      shopName: 'Outfitters',
                      shopType: 'Clothes',
                    ),
                  ),
                );
              },
            ),
            TextButton(
              child: Shopitem(
                imageurl:
                    'https://www.independent.ie/irish-news/cc37f/40429349.ece/AUTOCROP/w1240h700/penneys.jpg',
                shopName: 'Penneys',
                shopType: 'Shoes',
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopDetailsScreen(
                      imageurl:
                          'https://www.independent.ie/irish-news/cc37f/40429349.ece/AUTOCROP/w1240h700/penneys.jpg',
                      shopName: 'Penneys',
                      shopType: 'Shoes',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Shopitem extends StatelessWidget {
  // const Shopitem({ Key? key }) : super(key: key);

  final String imageurl;
  final String shopName;
  final String shopType;

  Shopitem(
      {@required this.imageurl,
      @required this.shopName,
      @required this.shopType});
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
