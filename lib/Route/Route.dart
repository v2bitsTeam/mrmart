import 'package:MrMart/ui/about_us/about_us_screen.dart';
import 'package:MrMart/ui/category/category_screen_with_app_bar/category_with_header_screen.dart';
import 'package:MrMart/ui/contact_us/contact_us_screen.dart';
import 'package:MrMart/ui/get_user_location/get_user_location_screen.dart';
import 'package:MrMart/ui/order_placed/order_placed_screen.dart';
import 'package:MrMart/ui/privacy_policy/privacy_policy_screen.dart';
import 'package:MrMart/ui/shipping_policy/shipping_policy_screen.dart';
import 'package:MrMart/ui/return_and_refund_policy/return_and_refund_policy_screen.dart';
import 'package:get/get.dart';
import 'package:MrMart/ui/MainPage.dart';
import 'package:MrMart/ui/auth/Authentication.dart';
import 'package:MrMart/ui/auth/ForgotPassword.dart';
import 'package:MrMart/ui/LocationPermission.dart';
import 'package:MrMart/ui/SearchLocation.dart';
import 'package:MrMart/ui/auth/TakePhoneNumber.dart';
import 'package:MrMart/ui/onBoarding/OnBoarding.dart';
import 'package:MrMart/ui/checkout/checkout_screen.dart';
import 'package:MrMart/ui/checkout/cart_summary/cart_summary_screen.dart';
import 'package:MrMart/ui/cart/cart_screen.dart';
import 'package:MrMart/ui/splash/splash_screen.dart';
import 'package:MrMart/ui/notification/notification_screen.dart';
import 'package:MrMart/ui/profile/profile_screen.dart';
import 'package:MrMart/ui/profile/recipients_details/recipients_details_screen.dart';
import 'package:MrMart/ui/profile/recipients_details_edit/recipients_details_screen_edit.dart';
import 'package:MrMart/ui/voucher/voucher_screen.dart';
import 'package:MrMart/ui/profile/my_voucher/my_voucher_screen.dart';
import 'package:MrMart/ui/profile/my_voucher_all/my_voucher_all_screen.dart';
import 'package:MrMart/ui/profile/followed_shop/followed_shop_screen.dart';
import 'package:MrMart/ui/profile/change_password/change_password_screen.dart';
import 'package:MrMart/ui/settings/settings_screen.dart';
import 'package:MrMart/ui/order/order_track/order_track_screen.dart';
import 'package:MrMart/ui/order/order_history/order_history_screen.dart';
import 'package:MrMart/ui/order/track_your_location/track_your_location_screen.dart';
import 'package:MrMart/ui/search/search_screen.dart';
import 'package:MrMart/ui/category/category_screen.dart';
import 'package:MrMart/ui/favorite_items/favorite_items_screen.dart';
import 'package:MrMart/ui/message/message_screen.dart';
import 'package:MrMart/ui/message_2/message_screen2.dart';
import 'package:MrMart/ui/RootPage.dart';
import 'package:MrMart/ui/category/trendings_item/trending_items_screen.dart';
import 'package:MrMart/ui/category/recommemded_Items/recommended_items_screen.dart';
import 'package:MrMart/ui/category/Items_details/item_details_screen.dart';
import 'package:MrMart/ui/category/shop_details/shop_details_screen.dart';
import 'package:MrMart/ui/category/todays_deal/todays_deal_screen.dart';
import 'package:MrMart/ui/category/todays_deal_details/todays_deal_details_screen.dart';
import 'package:MrMart/ui/category/trending_shop/trending_shop_screen.dart';
import 'package:MrMart/ui/category/all_shop/all_shop_screen.dart';
import 'package:MrMart/ui/category/favorite_items_with_header/favorite_items_with_header_screen.dart';
import 'package:MrMart/ui/filter/filter_screen.dart';
import 'package:MrMart/ui/add_location/add_location_screen.dart';
import 'package:MrMart/ui/help_center/help_center_screen.dart';
import 'package:MrMart/ui/terms_and_condition/terms_and_condition_screen.dart';
import 'package:MrMart/ui/checkout/add_new_card/add_new_card_screen.dart';

const String Main = "Home";
const String MAIN_PAGE = "Main Page";
const String CATEGORY_WITH_HEADER_SCREEN = "Category With Header Screen";
const String ON_BOARDING = "OnBoarding";
const String LOCATION_PERMISSION = "Location Permission";
const String SPLASH_SCREEN = "splash_screen";
const String SEARCH_LOCATION = "Search Location";
const String TAKE_PHONE_NUMBER = "Take phone number";
const String AUTHENTICATION = "Authentication";
const String FORGOT_PASSWORD = "Forgot Password";
const String CHECKOUT_SCREEN = "Checkout Screen";
const String CART_SCREEN = "Cart Screen";
const String CART_SUMMARY_SCREEN = "Cart Summary Screen";
const String ORDER_PLACED_SCREEN = "Order Placed Screen";
const String NOTIFICATION_SCREEN = "Notification Screen";
const String PROFILE_SCREEN = "Profile Screen";
const String RECIPIENTS_DETAILS_SCREEN = "Recipients Details Screen";
const String RECIPIENTS_DETAILS_SCREEN_EDIT = "Recipients Details Screen Edit";
const String VOUCHER_SCREEN = "Voucher Screen";
const String MY_VOUCHER_SCREEN = "My Voucher Screen";
const String MY_VOUCHER_ALL_SCREEN = "My Voucher All Screen";
const String FOLLOWED_SHOP_SCREEN = "Followed Shop Screen";
const String CHANGE_PASSWORD_SCREEN = "Change Password Screen";
const String SETTINGS_SCREEN = "Settings Screen";
const String ORDER_TRACK_SCREEN = "Order Track Screen";
const String ORDER_HISTORY_SCREEN = "Order History Screen";
const String TRACK_YOUR_LOCATION_SCREEN = "Track Your Location Screen";
const String SEARCH_SCREEN = "Search Screen";
const String CATEGORY_SCREEN = "Category Screen";
const String FAVORITE_SCREEN = "Favorite Screen";
const String MESSAGE_SCREEN = "Message Screen";
const String MESSAGE_SCREEN_2 = "Message Screen 2";
const String ROOT_PAGE = "Root Page";
const String TRENDING_ITEM_SCREEN = "Trending Items Screen";
const String RECOMMENDED_ITEM_SCREEN = "Recommended Items Screen";
const String ITEM_DETAILS_SCREEN = "Item Details Screen";
const String SHOP_DETAILS_SCREEN = "Shop Details Screen";
const String TODAYS_DEAL_SCREEN = "Todays Deal Screen";
const String TODAYS_DEAL_DETAILS_SCREEN = "Todays Deal Details Screen";
const String TRENDING_SHOP_SCREEN = "Trending Shop Screen";
const String ALL_SHOP_SCREEN = "All Shop Screen";
const String FAVORITE_ITEM_WITH_HEADER_SCREEN =
    "Favorite Items With Header Screen";
const String FILTER_SCREEN = "Filter Screen";
const String ADD_LOCATION_SCREEN = "Add Location Screen";
const String HELP_CENTER_SCREEN = "Help Center Screen";
const String ABOUT_US_SCREEN = "About Us Screen";
const String PRIVACY_POLICY_SCREEN = "Privacy Policy Screen";
const String SHIPPING_POLICY_SCREEN = "Shipping Policy Screen";
const String RETURN_AND_REFUND_POLICY_SCREEN =
    "Return and Refund Policy Screen";
const String TERMS_AND_CONDITION_SCREEN = "Terms and Condition Screen";
const String ADD_NEW_CARD_SCREEN = "Add New Card Screen";
const String GET_USER_LOCATION_SCREEN = "Get User Location";
const String CONTACT_US_SCREEN = "contact us";

List<GetPage> appRoutes() => [
      GetPage(name: MAIN_PAGE, page: () => MainPage()),
      GetPage(name: SPLASH_SCREEN, page: () => SplashScreen()),
      GetPage(
          name: GET_USER_LOCATION_SCREEN, page: () => GetUserLocationScreen()),
      GetPage(name: ON_BOARDING, page: () => OnBoarding()),
      GetPage(name: LOCATION_PERMISSION, page: () => LocationPermission()),
      GetPage(name: SEARCH_LOCATION, page: () => SearchLocation()),
      GetPage(name: TAKE_PHONE_NUMBER, page: () => TakePhoneNumber()),
      GetPage(name: AUTHENTICATION, page: () => Authentication()),
      GetPage(name: FORGOT_PASSWORD, page: () => ForgotPassword()),
      GetPage(name: CHECKOUT_SCREEN, page: () => CheckoutScreen()),
      GetPage(name: CART_SCREEN, page: () => CartScreen()),
      GetPage(name: CART_SUMMARY_SCREEN, page: () => CartSummaryScreen()),
      GetPage(name: ORDER_PLACED_SCREEN, page: () => OrderPlacedScreen()),
      GetPage(name: NOTIFICATION_SCREEN, page: () => NotificationScreen()),
      GetPage(name: PROFILE_SCREEN, page: () => ProfileScreen()),
      GetPage(
          name: RECIPIENTS_DETAILS_SCREEN,
          page: () => RecipientsDetailsScreen()),
      GetPage(
          name: RECIPIENTS_DETAILS_SCREEN_EDIT,
          page: () => RecipientsDetailsScreenEdit()),
      GetPage(name: VOUCHER_SCREEN, page: () => VoucherScreen()),
      GetPage(name: MY_VOUCHER_SCREEN, page: () => MyVoucherScreen()),
      GetPage(name: MY_VOUCHER_ALL_SCREEN, page: () => MyVoucherAllScreen()),
      GetPage(name: FOLLOWED_SHOP_SCREEN, page: () => FollowedShopScreen()),
      GetPage(name: CHANGE_PASSWORD_SCREEN, page: () => ChangePasswordScreen()),
      GetPage(name: SETTINGS_SCREEN, page: () => SettingsScreen()),
      GetPage(name: ORDER_TRACK_SCREEN, page: () => OrderTrackScreen()),
      GetPage(name: ORDER_HISTORY_SCREEN, page: () => OrderHistoryScreen()),
      GetPage(
          name: TRACK_YOUR_LOCATION_SCREEN,
          page: () => TrackYourLocationScreen()),
      GetPage(name: SEARCH_SCREEN, page: () => SearchScreen()),
      GetPage(name: CATEGORY_SCREEN, page: () => CategoryScreen()),
      GetPage(
          name: CATEGORY_WITH_HEADER_SCREEN,
          page: () => CategoryWithHeaderScreen()),
      GetPage(name: FAVORITE_SCREEN, page: () => FavoriteItemsScreen()),
      GetPage(name: MESSAGE_SCREEN, page: () => MessageScreen()),
      GetPage(name: MESSAGE_SCREEN_2, page: () => MessageScreen2()),
      GetPage(name: ROOT_PAGE, page: () => RootPage()),
      GetPage(name: TRENDING_ITEM_SCREEN, page: () => TrendingItemsScreen()),
      GetPage(
          name: RECOMMENDED_ITEM_SCREEN, page: () => RecommendedItemsScreen()),
      GetPage(name: ITEM_DETAILS_SCREEN, page: () => ItemDetailsScreen()),
      GetPage(name: SHOP_DETAILS_SCREEN, page: () => ShopDetailsScreen()),
      GetPage(
          name: TODAYS_DEAL_DETAILS_SCREEN,
          page: () => TodaysDealDetailsScreen()),
      GetPage(name: TODAYS_DEAL_SCREEN, page: () => TodaysDealScreen()),
      GetPage(name: TRENDING_SHOP_SCREEN, page: () => TrendingShopScreen()),
      GetPage(name: ALL_SHOP_SCREEN, page: () => AllShopScreen()),
      GetPage(
          name: FAVORITE_ITEM_WITH_HEADER_SCREEN,
          page: () => FavoriteItemsWithHeaderScreen()),
      GetPage(name: FILTER_SCREEN, page: () => FilterScreen()),
      GetPage(name: ADD_LOCATION_SCREEN, page: () => AddLocationScreen()),
      GetPage(name: ADD_NEW_CARD_SCREEN, page: () => AddNewCardScreen()),
      GetPage(name: HELP_CENTER_SCREEN, page: () => HelpCenterScreen()),
      GetPage(name: ABOUT_US_SCREEN, page: () => AboutUsScreen()),
      GetPage(name: CONTACT_US_SCREEN, page: () => ContactUsScreen()),
      GetPage(name: PRIVACY_POLICY_SCREEN, page: () => PrivacyPolicyScreen()),
      GetPage(name: SHIPPING_POLICY_SCREEN, page: () => ShippingPolicyScreen()),
      GetPage(
          name: RETURN_AND_REFUND_POLICY_SCREEN,
          page: () => ReturnAndRefundPolicyScreen()),
      GetPage(
          name: TERMS_AND_CONDITION_SCREEN,
          page: () => TermsAndConditionScreen()),
    ];
