import 'package:mr_mart/Language/EN.dart';

class AppConstant {
  static String appName = 'Mr MART';
  static String baseUrl = 'https://mrmart.co/';
  static String mediaUrl = baseUrl + 'images/';
  static String fontMukta = 'Mukta';
  static String fontOswald = 'Oswald';
  static String fontRoboto = 'Roboto';
  static String currencySymbol = '\u{20B9}';
  static String shareAuth = 'auth';
  static String shareLanguage = 'language';
  static String shareOnBoarding = 'onboarding';
  static String shareAddress = 'address';
  static String error = 'error';
  static String assetImage = 'asset_image';
  static String fileImage = 'file_image';
  static String android = 'ANDROID';
  static String iOS = 'IOS';
  static String roleId = 'role_id';
  static int defaultRoleId = 2;
  static String defaultCountry = 'in';
  static String defaultLanguage = 'en';
  static String defaultPhoneCode = '+91';
  static String defaultPhoneCodeImage = 'assets/images/bd.png';
  static String fcmDefaultChannel = 'fcm_default_channel';
  static int animationDelay = 375;
  static int productMaxImageUpload = 5;

  static Function defaultLanguageFunction = en();

  static String heroTagUpcomingRequest = 'Upcomming';
  static String heroTagAddProduct = 'Add Product';

  static String bearer = 'Bearer';
  static String id = 'id';
  static String storeId = 'store_id';
  static String password = 'password';
  static String passwordConfirmation = 'password_confirmation';
  static String deviceType = 'device_type';
  static String saltKey = 'salt_key';
  static String title = 'title';
  static String details = 'details';
  static String unauthorized = 'Unauthorized';
  static String message = 'message';
  static String responseData = 'responseData';
  static String addOnName = 'addon_name';
  static String addOnStatus = 'addon_status';
  static String active = 'active';
  static List<int> categoryStatusValue = [1, 0];
  static List<int> productStatusValue = [1, 0];
  static List<String> allDiscountTypeValue = ['PERCENTAGE', 'AMOUNT'];
  static String theGivenDataWasInvalid = 'The given data was invalid.';
  static String oK = 'OK';
  static String nO = 'NO';
  static String storeCategoryName = 'store_category_name';
  static String storeCategoryDescription = 'store_category_description';
  static String storeCategoryStatus = 'store_category_status';
  static String user = 'user';
  static String storeCategoryId = 'store_category_id';
  static String itemDescription = 'item_description';
  static String itemDiscountType = 'item_discount_type';
  static String itemDiscount = 'item_discount';
  static String itemStock = 'item_stock';
  static String itemName = 'item_name';
  static String itemPrice = 'item_price';
  static String picture = 'picture';
  static String addon = 'addon';
  static String addOnPrice = 'addon_price';
  static List<String> productVegTypeValue = ['Pure Veg', 'Non Veg'];
  static List<String> weekValue = [
    'SAT',
    'SUN',
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI'
  ];
  static String dayAll = 'ALL';
  static String storeOrderId = 'store_order_id';
  static String deliveryDate = 'delivery_date';
  static String userId = 'user_id';

  static String language = 'language';

  static String cookingTime = 'cooking_time';

  static String deviceToken = 'device_token';

  static String firebaseUid = 'firebase_uid';

  static String contactNumber = 'contact_number';

  static String countryCode = 'country_code';

  //static String email = 'email';
  static String storeName = 'store_name';
  static String storeTypeId = 'store_type_id';
  static String isVeg = 'is_veg';
  static String estimatedDeliveryTime = 'estimated_delivery_time';
  static String storeLocation = 'store_location';
  static String latitude = 'latitude';
  static String longitude = 'longitude';
  static String storeZipcode = 'store_zipcode';
  static String contactPerson = 'contact_person';
  static String storePackingCharges = 'store_packing_charges';
  static String storeGst = 'store_gst';
  static String offerMinAmount = 'offer_min_amount';
  static String offerPercent = 'offer_percent';
  static String description = 'description';
  static String countryId = 'country_id';
  static String cityId = 'city_id';
  static String commission = 'commission';
  static String zoneId = 'zone_id';
  static String freeDelivery = 'free_delivery';
  static String cuisineId = 'cuisine_id';

  ///this is array
  static String day = 'day';

  ///this is array
  static String hoursOpening = 'hours_opening';

  ///this is array
  static String hoursClosing = 'hours_closing';

  ///this is array

  static String pM = 'PM';
  static String aM = 'AM';

  static String unprocessableEntity = 'Unprocessable Entity';

  static String status = 'status';

  static String add = 'add';
  static String highlight = 'highlight';
  static String type = 'type';
  static String productType = 'License';
  static String featuredHighlight = 'featured';
  static String bestHighlight = 'best';
  static String topHighlight = 'top';
  static String bigHighlight = 'big';
  static String isDiscountHighlight = 'is_discount';
  static String hotHighlight = 'hot';
  static String latestHighlight = 'latest';
  static String trendingHighlight = 'trending';
  static String saleHighlight = 'sale';
  static String physicalType = 'Physical';
  static String digitalType = 'Digital';
  static String licenseType = 'License';
  static String normalProductType = 'normal';
  static String affiliateProductType = 'affiliate';
  static String bannerTypeTopSmall = 'TopSmall';
  static String bannerTypeBottomSmall = 'BottomSmall';
  static String bannerTypeLarge = 'Large';
  static String productId = 'product_id';

  static String newText = 'New';

  static String phone = 'phone';
  static String address = 'address';
  static String fullname = 'fullname';

  static String data = 'data';

  static String paginate = 'paginate';

  static String name = 'name';

  static String heroTag = 'HeroTag';

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

  static String heroTagSearch = 'Hero Search';

  static String rating = 'rating';
  static String comment = 'comment';
  static String commentId = 'comment_id';

  static String reply = 'reply';

  static String accessToken = 'access_token';

  static String fax = 'fax';

  static String city = 'city';
  static String house = 'house';

  static String country = 'country';
  static String zip = 'zip';
  static String photo = 'photo';

  static String currentPassword = 'current_password';
  static String newPassword = 'new_password';
  static String reNewPassword = 'renew_password';

  static String vendorId = 'vendor_id';
  static List<String> createProductTypeValue = [
    'Physical',
    'Digital',
    'License'
  ];

  static String subtitle = 'subtitle';
  static String price = 'price';

  static String pending = 'Pending';

  static String lat = 'lat';
  static String lon = 'lon';

  static String free = 'free';
  static String working = 'working';

  static String detailsAddress = 'details_address';

  static String levelId = 'level_id';
  static String packageId = 'package_id';
  static String days = 'days';
  static String hours = 'hours';

  static String estimationData = 'estimation_data';
  static String estimation = 'estimation';

  static String maidLevel = 'maid_level';

  static String success = 'success';

  static String verifyMobile = 'verify_mobile';
  static String username = 'username';

  static String personalId = 'personal_id';
  static String firstName = 'first_name';
  static String lastName = 'last_name';

  static String oldPassword = 'old_password';

  static String allRestaurant = 'all_restaurant';

  static String userProfile = 'user_profile';

  static String restaurantId = 'restaurant_id';

  static String lng = 'lng';

  static String quantity = 'quantity';

  static String code = 'code';
  static String shippingMethodId = 'shipping_method_id';
  static String paymentMethodType = 'payment_method_type';
  static String cardholderName = 'cardholder_name';
  static String cardNumber = 'card_number';
  static String cardCvv = 'card_cvv';
  static String expireDate = 'expire_date';
  static String paymentMethodNonce = 'payment_method_nonce';

  static String queryString = 'query_string';

  static String categoryId = 'category_id';

  static String isDeliveryAddress = 'is_delivery_address';

  static String userType = 'user_type';

  static String subject = 'subject';

  static String cartAmount = 'cart_amount';

  static String promoCodeId = 'promocode_id';
  static String promoCodeAmount = 'promocode_amount';

  static String order = 'order';

  static String totalPrice = 'total_price';
  static String vehicleType = 'vehicle_type';
  static String fuelType = 'fuel_type';
  static String fontImage = 'font_image';
  static String backImage = 'back_image';
  static String companyName = 'company_name';
  static String model = 'model';
  static String color = 'color';
  static String registationNo = 'registation_no';
  static String dateOfRegistation = 'date_of_registation';
  static String dateOfManufature = 'date_of_manufature';
  static String vehicleImage = 'vehicle_image';

  static List<String> vehicleTypes = ['BIKE', 'MOTORCYCLE', 'CAR'];
  static List<String> fuelTypes = ['DIESEL', 'PATROL', 'OCTEN'];

  static List<String> vehicleTypesValue = ['1', '2', '3'];
  static List<String> fuelTypesValue = ['1', '2', '3'];

  static String endDate = 'end_date';
  static String startDate = 'start_date';

  static String amount = 'amount';

  static String orderId = 'order_id';

  static String licenseFrontImage = 'license_front_image';
  static String licenseBackImage = 'license_back_image';
  static String licenseNumber = 'license_number';

  List<String> months = [
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
    'Dec',
  ];
  String offline = 'You are in offline ;(';

  String cancel = 'Cancel';
  List<String> week = [
    'Sat',
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
  ];
  String send = 'Send';
  String somethingWentWrong = 'Something went wrong!';

  String successCaps = 'Success';

  String yes = 'Yes';
  String no = 'No';
  String close = 'Close';
  String clear = 'Clear';

  String choose = 'Choose';

  String camera = 'Camera';

  String gallery = 'Gallery';

  String done = 'Done';

  String required = ' is required !';

  String noDataHere = 'No data here !';

  List<String> onboardingTitle = [
    'Fusce luctus luctus auctor.',
    'Duis dapibus nisl vitae.',
    'Augue vulputate tempu.'
  ];
  List<String> onboardingMessage = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing aenean ac tortor faucibus, gravida massa sit amet, vestibulum odio. Cras tortor risus, vestibulum at posuere Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing aenean ac tortor faucibus, gravida massa sit amet, vestibulum odio. Cras tortor risus, vestibulum at posuere Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'ALorem ipsum dolor sit amet, consectetur adipiscing aenean ac tortor faucibus, gravida massa sit amet, vestibulum odio. Cras tortor risus, vestibulum at posuere Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  ];

  String skip = 'Skip';
  String getStarted = 'Get Started';

  String locationPermission = 'Location Permission';

  String locationPermissionMessage =
      'For the best experience,please grant us permission to use your location.';

  String continueText = 'Continue';

  String searchLocation = 'Search Location';

  String searchYourLocation = 'Search your location';

  String enterYourPhoneNumber = 'Enter Your Phone Number';

  String enterPhoneNumberMessage =
      'Lorem ipsum dolor sit amet, consectetur adipiscing aenean ac tortor faucibus gravida.';

  String phoneVerifation = 'Phone Verification';

  String reSendCode = 'Resend Code';

  String createYourAccount = 'Create your Account';
  String signInYourAccount = 'Sign In your Account';

  String nameCaps = 'Name';
  String email = 'Email';
  String passwordCaps = 'Password';
  String confirmPassword = 'Confirm Password';
  String alreadyHaveAndAccount = 'Already have an account ?';
  String dontHaveAnAccount = 'Don\'t have an account ?';

  String signUp = 'Sign Up';
  String signIn = 'Sign In';
  String or = 'or';

  String forgotPassword = 'Forgot Password ?';

  List<String> forgotPasswordButton = [
    'Send',
    'Verify',
    'Reset Password',
  ];
  List<String> forgotPasswordTitle = [
    'Forget Password',
    'Code Verification',
    'Reset Password',
  ];
  List<String> forgotPasswordMessage = [
    'Enter your email address, I will send you a code for resetting your password.',
    'We sent a verification code in your email address. please check - mariahernandez@gmail.com',
    'Enter your email address, I will send you a code for resetting your password.',
  ];

  String newPasswordCaps = 'New Password';
  String confirmNewPasswordCaps = 'Confirm New Password';

  List<String> mainPageTab = [
    'Home',
    'Category',
    'Favorite',
    'Search',
    'Message'
  ];

  String deliveryTo = 'Delivery to';

  String filter = 'Filter';

  String seeAll = 'See All';

  String trendingItem = 'Trending Item';

  String off = 'Off';

  String todayDeal = 'Today\'s Deal';

  String only = 'Only';

  String addToCart = 'Add To Cart';

  String recommendedItems = 'Recommended Items';

  String trendingShop = 'Trending Shop';

  String kmAway = 'km Away';

  String allShop = 'All Shop';
}
