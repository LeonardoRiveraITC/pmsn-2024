class ProductsModel{
  int? id;
  String? producto;
  int? cantidad;
  String? fechaCaducidad;

  ProductsModel({this.id,this.producto,this.cantidad,this.fechaCaducidad});

  factory ProductsModel.fromMap(Map<String,dynamic> producto){
    return ProductsModel(
      id: producto['id'],
      cantidad: producto['cantidad'],
      fechaCaducidad: producto['fechaCaducidad'],
      producto: producto['producto']
    );
  }

}