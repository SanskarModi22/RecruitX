import 'package:flutter/material.dart';
import 'package:helping_hand/drawer/newshop.dart';

class ManageShops extends StatefulWidget {
  // const ManageShops({ Key? key }) : super(key: key);

  @override
  _ManageShopsState createState() => _ManageShopsState();
}

class _ManageShopsState extends State<ManageShops> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Shops'),
        backgroundColor: Colors.teal,
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
                    return NewShop();
                  },
                );
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ManageShopItem(
                imageurl:
                    'https://www.independent.ie/irish-news/cc37f/40429349.ece/AUTOCROP/w1240h700/penneys.jpg',
                shopName: 'Penneys',
                shopType: 'Shoes',
              ),
              ManageShopItem(
                imageurl:
                    'https://ichef.bbci.co.uk/news/976/cpsprodpb/8A13/production/_116574353_gettyimages-1229868118.jpg',
                shopName: 'Topshop',
                shopType: 'Sweets',
              ),
              ManageShopItem(
                imageurl:
                    'https://imganuncios.mitula.net/shop_from_12_lacs_showroom_warehouse_rent_store_main_gate_shops_office_2750077626957635821.jpg',
                shopName: 'Outfitters',
                shopType: 'Clothes',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ManageShopItem extends StatelessWidget {
  // const Shop({ Key? key }) : super(key: key);

  final String imageurl;
  final String shopName;
  final String shopType;
  ManageShopItem({
    this.imageurl,
    this.shopName,
    this.shopType,
  });
  @override
  Widget build(BuildContext context) {
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
                image: NetworkImage(imageurl),
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
                    color: Colors.teal,
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
                      shopType + ' Shop',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
              ),
            ),
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
