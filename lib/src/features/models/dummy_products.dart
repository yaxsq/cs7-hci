import 'package:hci_app/src/features/models/product_model.dart';
import 'package:hci_app/generated/app_localizations.dart';

List<Product> getDummyProducts(AppLocalizations localizations) {
  return [
    Product(id: '1', name: localizations.productName_1, description: localizations.productDescription_1, price: 3.99, oldPrice: 4.99, imageUrl: 'https://cdn.pixabay.com/photo/2018/07/23/18/43/hens-egg-3557544_960_720.jpg', category: 'Dairy'),
    Product(id: '2', name: localizations.productName_2, description: localizations.productDescription_2, price: 2.00, oldPrice: 3.50, imageUrl: 'https://cdn.pixabay.com/photo/2023/01/23/15/55/sourdough-7739022_960_720.jpg', category: 'Bakery'),
    Product(id: '3', name: localizations.productName_3, description: localizations.productDescription_3, price: 2.00, oldPrice: 2.99, imageUrl: 'https://cdn.pixabay.com/photo/2022/08/12/17/12/milk-7382115_960_720.jpg', category: 'Dairy'),
    Product(id: '4', name: localizations.productName_4, description: localizations.productDescription_4, price: 5.49, imageUrl: 'https://cdn.pixabay.com/photo/2010/12/16/12/09/keens-cheddar-3514_960_720.jpg', category: 'Dairy'),
    Product(id: '5', name: localizations.productName_5, description: localizations.productDescription_5, price: 1.99, imageUrl: 'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?q=80&w=2875&auto=format&fit=crop', category: 'Fruits'),
    Product(id: '6', name: localizations.productName_6, description: localizations.productDescription_6, price: 0.59, imageUrl: 'https://cdn.pixabay.com/photo/2014/04/16/09/58/banana-325461_960_720.jpg', category: 'Fruits'),
    Product(id: '7', name: localizations.productName_7, description: localizations.productDescription_7, price: 3.99, imageUrl: 'https://cdn.pixabay.com/photo/2015/07/02/16/45/strawberries-829271_960_720.jpg', category: 'Fruits'),
    Product(id: '8', name: localizations.productName_8, description: localizations.productDescription_8, price: 2.49, imageUrl: 'https://cdn.pixabay.com/photo/2020/06/03/16/20/broccoli-5255531_960_720.jpg', category: 'Vegetables'),
    Product(id: '9', name: localizations.productName_9, description: localizations.productDescription_9, price: 1.50, imageUrl: 'https://cdn.pixabay.com/photo/2016/09/29/08/33/apple-1702316_960_720.jpg', category: 'Fruits'),
  ];
}
