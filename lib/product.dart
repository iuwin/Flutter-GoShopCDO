class Product {
  String imagePath;
  String productName;

  Product({this.imagePath, this.productName});
}

List<Product> initProducts() {
  List<Product> products = [
    Product(
        imagePath: 'assets/products/gadgets/laptop.png',
        productName: 'HP Laptop'),
    Product(
        imagePath: 'assets/products/gadgets/mouse.png',
        productName: 'Wired Mouse'),
    Product(
        imagePath: 'assets/products/gadgets/keyboard.png',
        productName: 'Keyboard'),
    Product(
        imagePath: 'assets/products/gadgets/flashdrive.png',
        productName: 'Flashdrive'),
    Product(
        imagePath: 'assets/products/gadgets/wireless_camera.png',
        productName: 'Wireless Camera'),
  ];

  return products;
}
