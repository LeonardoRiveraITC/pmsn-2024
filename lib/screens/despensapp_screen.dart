 import 'package:flutter/material.dart';
import 'package:pmsn2024/database/products_database.dart';
import 'package:pmsn2024/model/products_model.dart';


class DespensaScreen extends StatefulWidget {
  DespensaScreen({Key? key}) : super(key: key);

  @override
  _DespensaScreenState createState() => _DespensaScreenState();
}     

class _DespensaScreenState extends State<DespensaScreen> {
  ProductsDatabase? productsDB;

  @override
  void initState(){
    super.initState();
    productsDB=new ProductsDatabase();   
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mi despensa"),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.shop))
      ],
      ),
      body: FutureBuilder(future: productsDB!.read(''), builder: (context, AsyncSnapshot<List<ProductsModel>> snapshot) {
        if(snapshot.hasError){
          return Center(child:Text("Something went wrong"));
        }else {
          if(snapshot.hasData){
            return Container();
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }
        
      },
      ),
    );
  }
}