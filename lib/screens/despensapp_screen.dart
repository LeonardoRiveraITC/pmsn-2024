import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  void initState() {
    super.initState();
    productsDB = new ProductsDatabase();
  }

  Widget build(BuildContext context) {
    final conNombre = TextEditingController();
    final txtNombre = TextFormField(
        keyboardType: TextInputType.text,
        controller: conNombre,
        decoration: const InputDecoration(border: OutlineInputBorder()));

    final conCantidad = TextEditingController();
    final txtCantidad = TextFormField(
        keyboardType: TextInputType.number,
        controller: conCantidad,
        decoration: const InputDecoration(border: OutlineInputBorder()));
    final space = SizedBox(height: 10);

    final conFecha = TextEditingController();

    final dateText = TextFormField(
        controller: conFecha, //editing controller of this TextField
        decoration: const InputDecoration(
            icon: Icon(Icons.calendar_today), //icon of text field
            labelText: "Enter Date" //label text of field
            ),
        readOnly: false, // when true user cannot edit text
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(), //get today's date
              firstDate: DateTime(
                  2000), //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime(2101));
          if (pickedDate != null) {
            print(
                pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
            String formattedDate = DateFormat('yyyy-MM-dd').format(
                pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
            print(
                formattedDate); //formatted date output using intl package =>  2022-07-04
            //You can format date as per your need

            setState(() {
              conFecha.text =
                  formattedDate; //set foratted date to TextField value.
            });
          } else {
            print("Date is not selected");
          }
        });

    final btnAgregar = ElevatedButton.icon(
      onPressed: () {
        Navigator.pop(context);
        productsDB!.insert(
          "productos", 
          {
            "producto":conNombre.text,
            "cantidad":conCantidad.text,
            "caducidad":conFecha.text}).then(
              (value) {
              String msj;
              if(value!=null){
              msj="Producto insertado";
            }else{
              msj="Ocurrio un error";
              var snackbar=SnackBar(content:Text(msj));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
            }) ;
      },  
      icon: Icon(Icons.save),
      label: Text("Guardar"),
    );
    final txtFecha = TextFormField(
      onTap: () {},
      controller: conFecha,
      decoration: const InputDecoration(border: OutlineInputBorder()),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Mi despensa"),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ListView(
                        padding: EdgeInsets.all(10),
                        children: [
                          txtNombre,
                          space,
                          txtCantidad,
                          space,
                          dateText,
                          space,
                          btnAgregar
                        ],
                      );
                    });
              },
              icon: Icon(Icons.shop))
        ],
      ),
      body: FutureBuilder(
        future: productsDB!.read(''),
        builder: (context, AsyncSnapshot<List<ProductsModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Something went wrong"));
          } else {
            if (snapshot.hasData) {
              return ListView.builder(itemCount: snapshot.data!.length,itemBuilder: (context,index){
                return itemDespensa(snapshot.data![index]);
              });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
  Widget itemDespensa(ProductsModel producto){
    return Container(
      height: 100,
      child: Column(
        children: [
          Text(" ${producto.producto!}"),
          Text(" ${producto.fechaCaducidad!}"),
          Text(" ${producto.cantidad!}"),
        ],
      )
    );
  }
}
