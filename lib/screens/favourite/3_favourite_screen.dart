import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/screens/favourite/my_favourites.dart';

import '../../provider/favourite_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selected = [];

  @override
  Widget build(BuildContext context) {
    print("Build");
    final favItemProvider = Provider.of<FavouriteItemProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Screen"),
        centerTitle: true,
        actions: [InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyFavourites()));
            },
            child: Icon(Icons.favorite))],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteItemProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          value.addItem(index);
                          print("Only ListTile Build");
                        },
                        title: Text(
                          "Item: " + index.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        trailing: value.selected.contains(index)
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_outline),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
