import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class MyFavourites extends StatefulWidget {
  const MyFavourites({Key? key}) : super(key: key);

  @override
  State<MyFavourites> createState() => _MyFavouritesState();
}

class _MyFavouritesState extends State<MyFavourites> {
  @override
  Widget build(BuildContext context) {
    final favItemProvider = Provider.of<FavouriteItemProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Favourite Screen"), centerTitle:  true,),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favItemProvider.selected.length,
                itemBuilder: (context, index){
                  return Consumer<FavouriteItemProvider>(
                    builder: (context, value, child){
                      return ListTile(
                        onTap: (){
                          // value.addItem(index);
                          print("Only ListTile Build");
                        },
                        title: Text("Item: "+favItemProvider.selected[index].toString(), style: TextStyle(fontSize: 20),),
                        trailing:  Icon(Icons.favorite) ,
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
