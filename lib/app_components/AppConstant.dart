import 'package:MrMart/Language/EN.dart';

class AppConstant {
  static String AppName = 'Mr MART';
  static String BaseUrl = "http://mrmart.co/";
  static String MediaUrl = BaseUrl + 'images/';
  static String font_mukta = 'Mukta';
  static String font_oswald = 'Oswald';
  static String font_roboto = "Roboto";
  static String currencySymbol = "\u{20B9}";
  static String Share_Auth = 'auth';
  static String Share_Language = 'language';
  static String Share_OnBoarding = 'onboarding';
  static String Share_Address = 'address';
  static String Error = 'error';
  static String Asset_Image = 'asset_image';
  static String File_Image = 'file_image';
  static String Android = 'ANDROID';
  static String iOS = 'IOS';
  static String role_id = 'role_id';
  static int default_role_id = 2;
  static String Default_Country = 'in';
  static String Default_Language = 'en';
  static String Default_Phone_Code = '+91';
  static String Default_Phone_Code_Image = 'assets/images/bd.png';
  static String fcm_default_channel = 'fcm_default_channel';
  // static AppLocale Default_Locale = AppLocale.EN;
  static Function Default_Language_Function = EN();

  static int AnimationDelay = 375;
  static int ProductMaxImageUpload = 5;

  static String heroTagUpcomingRequest = 'Upcomming';
  static String heroTagAddProduct = 'Add Product';

  static var Bearer = 'Bearer';
  static String id = 'id';
  static String store_id = 'store_id';
  //static String Email = 'email';
  static String password = 'password';
  static String password_confirmation = 'password_confirmation';
  static String device_type = 'device_type';
  static String salt_key = 'salt_key';
  static String title = 'title';
  static String details = 'details';
  static String Unauthorized = 'Unauthorized';
  static String message = 'message';
  static String responseData = 'responseData';
  static String addon_name = 'addon_name';
  static String addon_status = 'addon_status';
  static String active = 'active';
  static List<int> Category_Status_value = [1, 0];
  static List<int> Product_Status_value = [1, 0];
  static List<String> All_Discount_Type_Value = ['PERCENTAGE', 'AMOUNT'];
  static String The_given_data_was_invalid = 'The given data was invalid.';
  static String OK = "OK";
  static String NO = "NO";
  static var store_category_name = 'store_category_name';
  static var store_category_description = 'store_category_description';
  static var store_category_status = 'store_category_status';
  static var user = 'user';
  static var store_category_id = 'store_category_id';
  static var item_description = 'item_description';
  static var item_discount_type = 'item_discount_type';
  static var item_discount = 'item_discount';
  static var item_stock = 'item_stock';
  static var item_name = 'item_name';
  static var item_price = 'item_price';
  static var picture = 'picture';
  static var addon = 'addon';
  static var addon_price = 'addon_price';
  static List<String> Product_veg_type_value = ['Pure Veg', 'Non Veg'];
  static List<String> Week_value = [
    'SAT',
    'SUN',
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI'
  ];
  static String Day_ALL = 'ALL';
  static var store_order_id = 'store_order_id';
  static var delivery_date = 'delivery_date';
  static var user_id = 'user_id';

  static String Language = 'language';

  static String cooking_time = 'cooking_time';

  static String device_token = 'device_token';

  static String firebase_uid = 'firebase_uid';

  static String contact_number = 'contact_number';

  static String counrty_code = 'country_code';

  static String country_code = 'country_code';

  //static String email = 'email';
  static String store_name = 'store_name';
  static String store_type_id = 'store_type_id';
  static String is_veg = 'is_veg';
  static String estimated_delivery_time = 'estimated_delivery_time';
  static String store_location = 'store_location';
  static String latitude = 'latitude';
  static String longitude = 'longitude';
  static String store_zipcode = 'store_zipcode';
  static String contact_person = 'contact_person';
  static String store_packing_charges = 'store_packing_charges';
  static String store_gst = 'store_gst';
  static String offer_min_amount = 'offer_min_amount';
  static String offer_percent = 'offer_percent';
  static String description = 'description';
  static String country_id = 'country_id';
  static String city_id = 'city_id';
  static String commission = 'commission';
  static String zone_id = 'zone_id';
  static String free_delivery = 'free_delivery';
  static String cuisine_id = 'cuisine_id';

  ///this is array
  static String day = 'day';

  ///this is array
  static String hours_opening = 'hours_opening';

  ///this is array
  static String hours_closing = 'hours_closing';

  ///this is array

  static String PM = 'PM';
  static String AM = 'AM';

  static String Unprocessable_Entity = 'Unprocessable Entity';

  static String status = 'status';

  static String add = 'add';
  static String highlight = 'highlight';
  static String type = 'type';
  static String product_type = 'License';
  static String featuredHighlight = 'featured';
  static String bestHighlight = 'best';
  static String topHighlight = 'top';
  static String bigHighlight = 'big';
  static String isDiscountHighlight = 'is_discount';
  static String hotHighlight = 'hot';
  static String latestHighlight = 'latest';
  static String trendingHighlight = 'trending';
  static String saleHighlight = 'sale';
  static String PhysicalType = 'Physical';
  static String DigitalType = 'Digital';
  static String LicenseType = 'License';
  static String normalProductType = 'normal';
  static String affiliateProductType = 'affiliate';
  static String BannerTypeTopSmall = 'TopSmall';
  static String BannerTypeBottomSmall = 'BottomSmall';
  static String BannerTypeLarge = 'Large';
  static String product_id = 'product_id';

  static String New = 'New';

  static String phone = 'phone';
  static String address = 'address';
  static String fullname = 'fullname';

  static String data = 'data';

  static String paginate = 'paginate';

  static String name = 'name';

  static String HeroTag = 'HeroTag';

  static String max = 'max';
  static String min = 'min';
  static String sort = 'sort';
  static List<String> sortList = [
    'date_desc',
    'date_asc',
    'price_desc',
    'price_asc'
  ];
  static String term = 'term';

  static String HeroTagSearch = 'Hero Search';

  static String rating = 'rating';
  static String comment = 'comment';
  static String comment_id = 'comment_id';

  static String reply = 'reply';

  static var access_token = 'access_token';

  static String fax = 'fax';

  static String city = 'city';
  static String house = 'house';

  static String country = 'country';
  static String zip = 'zip';
  static String photo = 'photo';

  static String current_password = 'current_password';
  static String new_password = 'new_password';
  static String renew_password = 'renew_password';

  static String vendor_id = 'vendor_id';
  static List<String> Create_Product_Type_Value = [
    'Physical',
    'Digital',
    'License'
  ];

  static String subtitle = 'subtitle';
  static String price = 'price';

  static String Pending = 'Pending';

  // String Success = 'Success';

  static String lat = 'lat';
  static String lon = 'lon';

  static String free = 'free';
  static String working = 'working';

  static String details_address = 'details_address';

  static String level_id = 'level_id';
  static String package_id = 'package_id';
  static String days = 'days';
  static String hours = 'hours';

  static String estimation_data = 'estimation_data';
  static String estimation = 'estimation';

  static String maid_level = 'maid_level';

  static String success = 'success';

  static String verify_mobile = 'verify_mobile';
  static String username = 'username';

  static String personal_id = 'personal_id';
  static String first_name = 'first_name';
  static String last_name = 'last_name';

  static String old_password = 'old_password';

  static String all_restaurant = 'all_restaurant';

  static String user_profile = 'user_profile';

  static String restaurant_id = 'restaurant_id';

  static String lng = 'lng';

  static String quantity = 'quantity';

  static String code = 'code';
  static String shipping_method_id = 'shipping_method_id';
  static String payment_method_type = 'payment_method_type';
  static String cardholder_name = 'cardholder_name';
  static String card_number = 'card_number';
  static String card_cvv = 'card_cvv';
  static String expire_date = 'expire_date';
  static String payment_method_nonce = 'payment_method_nonce';

  static String query_string = 'query_string';

  static String category_id = 'category_id';

  static String is_delivery_address = 'is_delivery_address';

  static String user_type = 'user_type';

  static String subject = 'subject';

  static String cart_amount = 'cart_amount';

  static String promocode_id = 'promocode_id';
  static String promocode_amount = 'promocode_amount';

  static String order = 'order';

  static String total_price = 'total_price';
  static String vehicle_type = 'vehicle_type';
  static String fuel_type = 'fuel_type';
  static String font_image = 'font_image';
  static String back_image = 'back_image';
  static String company_name = 'company_name';
  static String model = 'model';
  static String color = 'color';
  static String registation_no = 'registation_no';
  static String date_of_registation = 'date_of_registation';
  static String date_of_manufature = 'date_of_manufature';
  static String vehicle_image = 'vehicle_image';

  static List<String> Vehicle_Types = ['BIKE', 'MOTORCYCLE', 'CAR'];
  static List<String> Fuel_Types = ['DIESEL', 'PATROL', 'OCTEN'];

  static List<String> Vehicle_Types_value = ['1', '2', '3'];
  static List<String> Fuel_Types_value = ['1', '2', '3'];

  static String end_date = 'end_date';
  static String start_date = 'start_date';

  static String amount = 'amount';

  static String order_id = 'order_id';

  static String license_front_image = 'license_front_image';
  static String license_back_image = 'license_back_image';
  static String license_number = 'license_number';

  List<String> Months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  String Offline = 'You are in offline ;(';

  String Cancel = 'Cancel';
  List<String> Week = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
  String Send = 'Send';
  String Something_went_wrong = 'Something went wrong!';

  String Success = 'Success';

  String Yes = 'Yes';
  String No = 'No';
  String Close = 'Close';
  String Clear = 'Clear';

  String Choose = 'Choose';

  String Camera = 'Camera';

  String Gallery = 'Gallery';

  String Done = 'Done';

  String Required = ' is required !';

  String No_data_here = 'No data here !';

  List<String> OnboardingTitle = [
    'Fusce luctus luctus auctor.',
    'Duis dapibus nisl vitae.',
    'Augue vulputate tempu.'
  ];
  List<String> OnboardingMessage = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing aenean ac tortor faucibus, gravida massa sit amet, vestibulum odio. Cras tortor risus, vestibulum at posuere Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing aenean ac tortor faucibus, gravida massa sit amet, vestibulum odio. Cras tortor risus, vestibulum at posuere Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'ALorem ipsum dolor sit amet, consectetur adipiscing aenean ac tortor faucibus, gravida massa sit amet, vestibulum odio. Cras tortor risus, vestibulum at posuere Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  ];

  String Skip = 'Skip';
  String Get_Started = 'Get Started';

  String Location_Permission = 'Location Permission';

  String Location_Permission_Message =
      'For the best experience,please grant us permission to use your location.';

  String Continue = 'Continue';

  String Search_Location = 'Search Location';

  String Search_Your_location = 'Search your location';

  String Enter_your_phoneNimber = 'Enter Your Phone Number';

  String Enter_Phone_number_message =
      'Lorem ipsum dolor sit amet, consectetur adipiscing aenean ac tortor faucibus gravida.';

  String Phone_Verifation = 'Phone Verification';

  String Resend_Code = 'Resend Code';

  String Create_your_account = 'Create your Account';
  String SignIn_your_account = 'Sign In your Account';

  String Name = 'Name';
  String Email = 'Email';
  String Password = 'Password';
  String Confirm_Password = 'Confirm Password';
  String Already_have_and_account = 'Already have an account ?';
  String Dont_have_an_account = 'Don\'t have an account ?';

  String SignUp = 'Sign Up';
  String SignIn = 'Sign In';
  String or = 'or';

  String Forgot_Password = 'Forgot Password ?';

  List<String> Forgot_Password_Button = ['Send', 'Verify', 'Reset Password'];
  List<String> Forgot_Password_Title = [
    'Forget Password',
    'Code Verification',
    'Reset Password'
  ];
  List<String> Forgot_Password_Message = [
    'Enter your email address, I will send you a code for resetting your password.',
    'We sent a verification code in your email address. please check - mariahernandez@gmail.com',
    'Enter your email address, I will send you a code for resetting your password.'
  ];
  /* List<String> Phone_verification_Button=['Send','Verify','Continue'];
  List<String> Phone_verification_Title=['Phone Verification','Code Verification','Verify number'];
  List<String> Phone_verification_Message=['Lorem ipsum dolor sit amet, consectetur adipiscing aenean ac tortor faucibus gravida.','We sent a verification code in your mobile number. please check - 01712345678','Enter your mobile number, I will send you a code for verify your mobile number.'];
*/
  String New_password = 'New Password';
  String Confirm_New_password = 'Confirm New Password';

  List<String> Main_Page_Tab = [
    'Home',
    'Category',
    'Favorite',
    'Search',
    'Message'
  ];

  String Delivery_to = 'Delivery to';

  String Filter = 'Filter';

  String See_All = 'See All';

  String Trending_Item = 'Trending Item';

  String Off = 'Off';

  String Today_Deal = 'Today\'s Deal';

  String Only = 'Only';

  String Add_to_cart = 'Add To Cart';

  String Recommended_Items = 'Recommended Items';

  String Trending_Shop = 'Trending Shop';

  String Km_Away = 'km Away';

  String All_Shop = 'All Shop';
}
