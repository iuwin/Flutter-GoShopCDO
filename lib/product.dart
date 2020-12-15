class Product {
  String imagePath;
  String productName;
  String category;

  Product({this.imagePath, this.productName, this.category});
}

List<Product> initProducts() {
  List<Product> products = [
    //Clothing
    Product(
        imagePath: 'assets/products/clothing/girl_jacket.png',
        productName: 'Women\'s Jacket',
        category: 'clothing'),
    Product(
        imagePath: 'assets/products/clothing/cap.png',
        productName: 'Nike Cap',
        category: 'clothing'),
    Product(
        imagePath: 'assets/products/clothing/boy_jacket.png',
        productName: 'Men\'s Jacket',
        category: 'clothing'),
    Product(
        imagePath: 'assets/products/clothing/jeans.png',
        productName: 'Jeans',
        category: 'clothing'),
    Product(
        imagePath: 'assets/products/clothing/jordan_shoes.png',
        productName: 'Jordan Shoes',
        category: 'clothing'),

    //Gadgets
    Product(
        imagePath: 'assets/products/gadgets/laptop.png',
        productName: 'HP Laptop',
        category: 'gadgets'),
    Product(
        imagePath: 'assets/products/gadgets/mouse.png',
        productName: 'Wired Mouse',
        category: 'gadgets'),
    Product(
        imagePath: 'assets/products/gadgets/keyboard.png',
        productName: 'Keyboard',
        category: 'gadgets'),
    Product(
        imagePath: 'assets/products/gadgets/flashdrive.png',
        productName: 'Flashdrive',
        category: 'gadgets'),
    Product(
        imagePath: 'assets/products/gadgets/wireless_camera.png',
        productName: 'Wireless Camera',
        category: 'gadgets'),

    //Furnitures
    Product(
        imagePath: 'assets/products/furniture/sofa.png',
        productName: 'Sofa',
        category: 'furniture'),
    Product(
        imagePath: 'assets/products/furniture/chair.png',
        productName: 'Wooden Chair',
        category: 'furniture'),
    Product(
        imagePath: 'assets/products/furniture/bed.png',
        productName: 'Bed',
        category: 'furniture'),
    Product(
        imagePath: 'assets/products/furniture/table.png',
        productName: 'Table',
        category: 'furniture'),
    Product(
        imagePath: 'assets/products/furniture/umbrella_holder.png',
        productName: 'Umbrella Holder',
        category: 'furniture'),

    //Toys
    Product(
        imagePath: 'assets/products/toys/stuff_toy.png',
        productName: 'Stuff Toy',
        category: 'toy'),
    Product(
        imagePath: 'assets/products/toys/doll_house.png',
        productName: 'Doll House',
        category: 'toy'),
    Product(
        imagePath: 'assets/products/toys/cow_piano.png',
        productName: 'Cow Piano',
        category: 'toy'),
    Product(
        imagePath: 'assets/products/toys/robot.png',
        productName: 'Robot',
        category: 'toy'),
    Product(
        imagePath: 'assets/products/toys/toy_gun.png',
        productName: 'Toy Gun',
        category: 'toy'),

    //Hardware

    Product(
        imagePath: 'assets/products/hardware/hammer.png',
        productName: 'Hammer',
        category: 'hardware'),
    Product(
        imagePath: 'assets/products/hardware/tool_case.png',
        productName: 'Tool Case',
        category: 'hardware'),
    Product(
        imagePath: 'assets/products/hardware/doorknob.png',
        productName: 'Door knob',
        category: 'hardware'),
    Product(
        imagePath: 'assets/products/hardware/plier.png',
        productName: 'Lineman\'s Plier',
        category: 'hardware'),
  ];

  return products;
}
