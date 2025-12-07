import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ur'),
  ];

  /// No description provided for @deliverTo.
  ///
  /// In en, this message translates to:
  /// **'DELIVER TO'**
  String get deliverTo;

  /// No description provided for @deliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'123 Main St, Anytown'**
  String get deliveryAddress;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search for groceries'**
  String get searchHint;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @fruits.
  ///
  /// In en, this message translates to:
  /// **'Fruits'**
  String get fruits;

  /// No description provided for @dairy.
  ///
  /// In en, this message translates to:
  /// **'Dairy'**
  String get dairy;

  /// No description provided for @bakery.
  ///
  /// In en, this message translates to:
  /// **'Bakery'**
  String get bakery;

  /// No description provided for @vegetables.
  ///
  /// In en, this message translates to:
  /// **'Vegetables'**
  String get vegetables;

  /// No description provided for @meat.
  ///
  /// In en, this message translates to:
  /// **'Meat'**
  String get meat;

  /// No description provided for @weeklyDeals.
  ///
  /// In en, this message translates to:
  /// **'Weekly Deals'**
  String get weeklyDeals;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @freshProduce.
  ///
  /// In en, this message translates to:
  /// **'Fresh Produce'**
  String get freshProduce;

  /// No description provided for @summerBBQ.
  ///
  /// In en, this message translates to:
  /// **'Summer BBQ Essentials'**
  String get summerBBQ;

  /// No description provided for @grillingSeason.
  ///
  /// In en, this message translates to:
  /// **'Get ready for grilling season!'**
  String get grillingSeason;

  /// No description provided for @accessibilityMenu.
  ///
  /// In en, this message translates to:
  /// **'Accessibility Menu'**
  String get accessibilityMenu;

  /// No description provided for @largerFont.
  ///
  /// In en, this message translates to:
  /// **'Larger Font'**
  String get largerFont;

  /// No description provided for @highContrast.
  ///
  /// In en, this message translates to:
  /// **'High Contrast'**
  String get highContrast;

  /// No description provided for @narrator.
  ///
  /// In en, this message translates to:
  /// **'Narrator'**
  String get narrator;

  /// No description provided for @urdu.
  ///
  /// In en, this message translates to:
  /// **'Urdu'**
  String get urdu;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @myCart.
  ///
  /// In en, this message translates to:
  /// **'My Cart'**
  String get myCart;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @deliveryFee.
  ///
  /// In en, this message translates to:
  /// **'Delivery Fee'**
  String get deliveryFee;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @proceedToCheckout.
  ///
  /// In en, this message translates to:
  /// **'Proceed to Checkout'**
  String get proceedToCheckout;

  /// No description provided for @continueShopping.
  ///
  /// In en, this message translates to:
  /// **'Continue Shopping'**
  String get continueShopping;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @selectDeliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Select Delivery Address'**
  String get selectDeliveryAddress;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @homeAddress.
  ///
  /// In en, this message translates to:
  /// **'123 Main St, Anytown, USA'**
  String get homeAddress;

  /// No description provided for @work.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get work;

  /// No description provided for @workAddress.
  ///
  /// In en, this message translates to:
  /// **'456 Oak Ave, Sometown, USA'**
  String get workAddress;

  /// No description provided for @addNewAddress.
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get addNewAddress;

  /// No description provided for @selectPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Method'**
  String get selectPaymentMethod;

  /// No description provided for @creditCard.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get creditCard;

  /// No description provided for @creditCardNumber.
  ///
  /// In en, this message translates to:
  /// **'**** **** **** 1234'**
  String get creditCardNumber;

  /// No description provided for @paypal.
  ///
  /// In en, this message translates to:
  /// **'PayPal'**
  String get paypal;

  /// No description provided for @paypalEmail.
  ///
  /// In en, this message translates to:
  /// **'user@example.com'**
  String get paypalEmail;

  /// No description provided for @reviewYourOrder.
  ///
  /// In en, this message translates to:
  /// **'Review Your Order'**
  String get reviewYourOrder;

  /// No description provided for @quantityShort.
  ///
  /// In en, this message translates to:
  /// **'Qty: {quantity}'**
  String quantityShort(Object quantity);

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'BACK'**
  String get back;

  /// No description provided for @placeOrder.
  ///
  /// In en, this message translates to:
  /// **'PLACE ORDER'**
  String get placeOrder;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'CONTINUE'**
  String get continueText;

  /// No description provided for @orderPlacedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Order placed successfully!'**
  String get orderPlacedSuccessfully;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @productDetails.
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get productDetails;

  /// No description provided for @nutritionalFacts.
  ///
  /// In en, this message translates to:
  /// **'Nutritional Facts'**
  String get nutritionalFacts;

  /// No description provided for @nutritionalFactsContent.
  ///
  /// In en, this message translates to:
  /// **'Calories: 150, Fat: 10g, Protein: 5g, Carbs: 10g'**
  String get nutritionalFactsContent;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @itemAddedToCart.
  ///
  /// In en, this message translates to:
  /// **'{itemName} (x{quantity}) added to cart!'**
  String itemAddedToCart(Object itemName, Object quantity);

  /// No description provided for @recentSearches.
  ///
  /// In en, this message translates to:
  /// **'Recent Searches'**
  String get recentSearches;

  /// No description provided for @popularItems.
  ///
  /// In en, this message translates to:
  /// **'Popular Items'**
  String get popularItems;

  /// No description provided for @organicMilk.
  ///
  /// In en, this message translates to:
  /// **'Organic Milk'**
  String get organicMilk;

  /// No description provided for @freshBerries.
  ///
  /// In en, this message translates to:
  /// **'Fresh Berries'**
  String get freshBerries;

  /// No description provided for @cheddarCheese.
  ///
  /// In en, this message translates to:
  /// **'Cheddar Cheese'**
  String get cheddarCheese;

  /// No description provided for @homeNav.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeNav;

  /// No description provided for @browseNav.
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get browseNav;

  /// No description provided for @cartNav.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cartNav;

  /// No description provided for @accountNav.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get accountNav;

  /// No description provided for @accountTitle.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get accountTitle;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'Syed Rafay Ahmed'**
  String get userName;

  /// No description provided for @orderHistory.
  ///
  /// In en, this message translates to:
  /// **'Order History'**
  String get orderHistory;

  /// No description provided for @deliveryAddressTitle.
  ///
  /// In en, this message translates to:
  /// **'Delivery Address'**
  String get deliveryAddressTitle;

  /// No description provided for @deliveryAddressContent.
  ///
  /// In en, this message translates to:
  /// **'Jane Doe\\n2464 Royal Ln. Mesa, New Jersey 45463'**
  String get deliveryAddressContent;

  /// No description provided for @emailTitle.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailTitle;

  /// No description provided for @emailContent.
  ///
  /// In en, this message translates to:
  /// **'syedrafayahmeds@gmail.com'**
  String get emailContent;

  /// No description provided for @phoneNumberTitle.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumberTitle;

  /// No description provided for @phoneNumberContent.
  ///
  /// In en, this message translates to:
  /// **'+92 3482234578'**
  String get phoneNumberContent;

  /// No description provided for @trackOrder.
  ///
  /// In en, this message translates to:
  /// **'Track Order'**
  String get trackOrder;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @setDeliveryLocation.
  ///
  /// In en, this message translates to:
  /// **'Set delivery location'**
  String get setDeliveryLocation;

  /// No description provided for @yourLocation.
  ///
  /// In en, this message translates to:
  /// **'Your Location'**
  String get yourLocation;

  /// No description provided for @defaultLocation.
  ///
  /// In en, this message translates to:
  /// **'123 Market Street, Downtown'**
  String get defaultLocation;

  /// No description provided for @confirmLocation.
  ///
  /// In en, this message translates to:
  /// **'Confirm Location'**
  String get confirmLocation;

  /// No description provided for @trackMyOrder.
  ///
  /// In en, this message translates to:
  /// **'Track My Order'**
  String get trackMyOrder;

  /// No description provided for @orderOnItsWay.
  ///
  /// In en, this message translates to:
  /// **'Your order is on its way!'**
  String get orderOnItsWay;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @productName_1.
  ///
  /// In en, this message translates to:
  /// **'Organic Eggs'**
  String get productName_1;

  /// No description provided for @productDescription_1.
  ///
  /// In en, this message translates to:
  /// **'A dozen of our finest organic eggs.'**
  String get productDescription_1;

  /// No description provided for @productName_2.
  ///
  /// In en, this message translates to:
  /// **'Bread'**
  String get productName_2;

  /// No description provided for @productDescription_2.
  ///
  /// In en, this message translates to:
  /// **'Freshly baked bread.'**
  String get productDescription_2;

  /// No description provided for @productName_3.
  ///
  /// In en, this message translates to:
  /// **'Organic Milk'**
  String get productName_3;

  /// No description provided for @productDescription_3.
  ///
  /// In en, this message translates to:
  /// **'A gallon of fresh organic milk.'**
  String get productDescription_3;

  /// No description provided for @productName_4.
  ///
  /// In en, this message translates to:
  /// **'Cheddar Cheese'**
  String get productName_4;

  /// No description provided for @productDescription_4.
  ///
  /// In en, this message translates to:
  /// **'A block of sharp cheddar cheese.'**
  String get productDescription_4;

  /// No description provided for @productName_5.
  ///
  /// In en, this message translates to:
  /// **'Avocados'**
  String get productName_5;

  /// No description provided for @productDescription_5.
  ///
  /// In en, this message translates to:
  /// **'A bag of ripe avocados.'**
  String get productDescription_5;

  /// No description provided for @productName_6.
  ///
  /// In en, this message translates to:
  /// **'Bananas'**
  String get productName_6;

  /// No description provided for @productDescription_6.
  ///
  /// In en, this message translates to:
  /// **'A bunch of sweet bananas.'**
  String get productDescription_6;

  /// No description provided for @productName_7.
  ///
  /// In en, this message translates to:
  /// **'Strawberries'**
  String get productName_7;

  /// No description provided for @productDescription_7.
  ///
  /// In en, this message translates to:
  /// **'A punnet of fresh strawberries.'**
  String get productDescription_7;

  /// No description provided for @productName_8.
  ///
  /// In en, this message translates to:
  /// **'Broccoli'**
  String get productName_8;

  /// No description provided for @productDescription_8.
  ///
  /// In en, this message translates to:
  /// **'Fresh broccoli florets.'**
  String get productDescription_8;

  /// No description provided for @productName_9.
  ///
  /// In en, this message translates to:
  /// **'Apples'**
  String get productName_9;

  /// No description provided for @productDescription_9.
  ///
  /// In en, this message translates to:
  /// **'Crisp red apples.'**
  String get productDescription_9;

  /// No description provided for @emptyCartMessage1.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get emptyCartMessage1;

  /// No description provided for @emptyCartMessage2.
  ///
  /// In en, this message translates to:
  /// **'Browse products and add them to your cart.'**
  String get emptyCartMessage2;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
