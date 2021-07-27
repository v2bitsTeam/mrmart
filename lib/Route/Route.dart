import 'package:mr_mart/ui/about_us/about_us_screen.dart';
import 'package:mr_mart/ui/category/category_screen_with_app_bar/category_with_header_screen.dart';
import 'package:mr_mart/ui/contact_us/contact_us_screen.dart';
import 'package:mr_mart/ui/get_user_location/get_user_location_screen.dart';
import 'package:mr_mart/ui/order_placed/order_placed_screen.dart';
import 'package:mr_mart/ui/privacy_policy/privacy_policy_screen.dart';
import 'package:mr_mart/ui/shipping_policy/shipping_policy_screen.dart';
import 'package:mr_mart/ui/return_and_refund_policy/return_and_refund_policy_screen.dart';
import 'package:get/get.dart';
import 'package:mr_mart/ui/MainPage.dart';
import 'package:mr_mart/ui/auth/Authentication.dart';
import 'package:mr_mart/ui/auth/ForgotPassword.dart';
import 'package:mr_mart/ui/LocationPermission.dart';
import 'package:mr_mart/ui/SearchLocation.dart';
import 'package:mr_mart/ui/auth/TakePhoneNumber.dart';
import 'package:mr_mart/ui/onBoarding/OnBoarding.dart';
import 'package:mr_mart/ui/checkout/checkout_screen.dart';
import 'package:mr_mart/ui/checkout/cart_summary/cart_summary_screen.dart';
import 'package:mr_mart/ui/cart/cart_screen.dart';
import 'package:mr_mart/ui/splash/splash_screen.dart';
import 'package:mr_mart/ui/notification/notification_screen.dart';
import 'package:mr_mart/ui/profile/profile_screen.dart';
import 'package:mr_mart/ui/profile/recipients_details/recipients_details_screen.dart';
import 'package:mr_mart/ui/profile/recipients_details_edit/recipients_details_screen_edit.dart';
import 'package:mr_mart/ui/voucher/voucher_screen.dart';
import 'package:mr_mart/ui/profile/my_voucher/my_voucher_screen.dart';
import 'package:mr_mart/ui/profile/my_voucher_all/my_voucher_all_screen.dart';
import 'package:mr_mart/ui/profile/followed_shop/followed_shop_screen.dart';
import 'package:mr_mart/ui/profile/change_password/change_password_screen.dart';
import 'package:mr_mart/ui/settings/settings_screen.dart';
import 'package:mr_mart/ui/order/order_track/order_track_screen.dart';
import 'package:mr_mart/ui/order/order_history/order_history_screen.dart';
import 'package:mr_mart/ui/order/track_your_location/track_your_location_screen.dart';
import 'package:mr_mart/ui/search/search_screen.dart';
import 'package:mr_mart/ui/category/category_screen.dart';
import 'package:mr_mart/ui/favorite_items/favorite_items_screen.dart';
import 'package:mr_mart/ui/message/message_screen.dart';
import 'package:mr_mart/ui/message_2/message_screen2.dart';
import 'package:mr_mart/ui/RootPage.dart';
import 'package:mr_mart/ui/category/trendings_item/trending_items_screen.dart';
import 'package:mr_mart/ui/category/recommemded_Items/recommended_items_screen.dart';
import 'package:mr_mart/ui/category/Items_details/item_details_screen.dart';
import 'package:mr_mart/ui/category/shop_details/shop_details_screen.dart';
import 'package:mr_mart/ui/category/todays_deal/todays_deal_screen.dart';
import 'package:mr_mart/ui/category/todays_deal_details/todays_deal_details_screen.dart';
import 'package:mr_mart/ui/category/trending_shop/trending_shop_screen.dart';
import 'package:mr_mart/ui/category/all_shop/all_shop_screen.dart';
import 'package:mr_mart/ui/category/favorite_items_with_header/favorite_items_with_header_screen.dart';
import 'package:mr_mart/ui/filter/filter_screen.dart';
import 'package:mr_mart/ui/add_location/add_location_screen.dart';
import 'package:mr_mart/ui/help_center/help_center_screen.dart';
import 'package:mr_mart/ui/terms_and_condition/terms_and_condition_screen.dart';
import 'package:mr_mart/ui/checkout/add_new_card/add_new_card_screen.dart';

const String Main = '/home';
const String MAIN_PAGE = '/main-page';
const String CATEGORY_WITH_HEADER_SCREEN = '/category-with-header-screen';
const String ON_BOARDING = '/onboarding';
const String LOCATION_PERMISSION = '/location-permission';
const String SPLASH_SCREEN = '/splash-screen';
const String SEARCH_LOCATION = '/search-location';
const String TAKE_PHONE_NUMBER = '/take-phone-number';
const String AUTHENTICATION = '/authentication';
const String FORGOT_PASSWORD = '/forgot-password';
const String CHECKOUT_SCREEN = '/checkout-screen';
const String CART_SCREEN = '/cart-screen';
const String CART_SUMMARY_SCREEN = '/cart-summary-screen';
const String ORDER_PLACED_SCREEN = '/order-placed-screen';
const String NOTIFICATION_SCREEN = '/notification-screen';
const String PROFILE_SCREEN = '/profile-screen';
const String RECIPIENTS_DETAILS_SCREEN = '/recipients-details-screen';
const String RECIPIENTS_DETAILS_SCREEN_EDIT = '/recipients-details-screen-edit';
const String VOUCHER_SCREEN = '/voucher-screen';
const String MY_VOUCHER_SCREEN = '/my-voucher-screen';
const String MY_VOUCHER_ALL_SCREEN = '/my-voucher-all-screen';
const String FOLLOWED_SHOP_SCREEN = '/followed-shop-screen';
const String CHANGE_PASSWORD_SCREEN = '/change-password-screen';
const String SETTINGS_SCREEN = '/settings-screen';
const String ORDER_TRACK_SCREEN = '/order-track-screen';
const String ORDER_HISTORY_SCREEN = '/order-history-screen';
const String TRACK_YOUR_LOCATION_SCREEN = '/track-your-location-screen';
const String SEARCH_SCREEN = '/search-screen';
const String CATEGORY_SCREEN = '/category-screen';
const String FAVORITE_SCREEN = '/favorite-screen';
const String MESSAGE_SCREEN = '/message-screen';
const String MESSAGE_SCREEN_2 = '/message-screen-2';
const String ROOT_PAGE = '/root-page';
const String TRENDING_ITEM_SCREEN = '/trending-items-screen';
const String RECOMMENDED_ITEM_SCREEN = '/recommended-items-screen';
const String ITEM_DETAILS_SCREEN = '/item-details-screen';
const String SHOP_DETAILS_SCREEN = '/shop-details-screen';
const String TODAYS_DEAL_SCREEN = '/todays-deal-screen';
const String TODAYS_DEAL_DETAILS_SCREEN = '/todays-deal-details-screen';
const String TRENDING_SHOP_SCREEN = '/trending-shop-screen';
const String ALL_SHOP_SCREEN = '/all-shop-screen';
const String FAVORITE_ITEM_WITH_HEADER_SCREEN =
    '/favorite-items-with-header-screen';
const String FILTER_SCREEN = '/filter-screen';
const String ADD_LOCATION_SCREEN = '/add-location-screen';
const String HELP_CENTER_SCREEN = '/help-center-screen';
const String ABOUT_US_SCREEN = '/about-us-screen';
const String PRIVACY_POLICY_SCREEN = '/privacy-policy-screen';
const String SHIPPING_POLICY_SCREEN = '/shipping-policy-screen';
const String RETURN_AND_REFUND_POLICY_SCREEN =
    '/return-and-refund-policy-screen';
const String TERMS_AND_CONDITION_SCREEN = '/terms-and-condition-screen';
const String ADD_NEW_CARD_SCREEN = '/add-new-card-screen';
const String GET_USER_LOCATION_SCREEN = '/get-user-location';
const String CONTACT_US_SCREEN = '/contact-us';

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
