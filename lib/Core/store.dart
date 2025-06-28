
import 'package:farmsanta_new/Models/Common/cardmodel.dart';
import 'package:farmsanta_new/Models/Common/crop_model.dart';
import 'package:farmsanta_new/Models/Common/id_name.dart';
import 'package:farmsanta_new/Models/Common/territory.dart';
import 'package:farmsanta_new/Models/Farmer/Farmer.dart';
import 'package:farmsanta_new/Models/User/UserToken.dart';
import 'package:farmsanta_new/Models/User/user.dart';
import 'package:geolocator/geolocator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Models/Common/farm_model.dart';
import '../Models/Home/Price.dart';
import '../Models/MarketPlace/Purchase/purchase_order_model.dart';
import '../Models/MarketPlace/category_model.dart';
import '../Models/MarketPlace/offer_model.dart';
import '../Models/MarketPlace/product_model.dart';
import '../Models/MarketPlace/review_model.dart';
import '../Models/MarketPlace/store_model.dart';
import '../Models/MarketPlace/variant_model.dart';
import '../Models/Profile/CropStage.dart';
import '../Models/SupportPlace/CropAdvisory/crop_advisory_model.dart';
import '../Models/SupportPlace/CropCalender/CropCalender.dart';
import '../Models/SupportPlace/CropCalender/CropStageCalendar.dart';
import '../Models/SupportPlace/Disease/Disease.dart';
import '../Models/SupportPlace/POP/PopDetailsDTO.dart';
import '../Models/SupportPlace/POP/PopDto.dart';
import '../Models/SupportPlace/Weather/WeatherData.dart';
import '../Models/SupportPlace/calculator/FertilizerGeneratedReport.dart';
import '../Models/SupportPlace/calculator/FertilizerSourceDetails.dart';
import '../Models/SupportPlace/calculator/fertilizer_crop_controller_model.dart';
import '../Models/SupportPlace/calculator/fertilizer_fruit_calculator.dart';
import '../Models/SupportPlace/calculator/fertilizer_fruit_calculator_details.dart';
import '../Models/SupportPlace/farmscout/advisory_details.dart';
import '../Models/SupportPlace/farmscout/advisory_table.dart';
import '../Models/SupportPlace/farmscout/farm_scouting.dart';
import '../Models/SupportPlace/master/CropMaster.dart';
import '../Models/master/GlobalIndicatorDTO.dart';
import '../Models/message/message.dart';
import '../Models/tags/trendingTags.dart';

class MyStore extends VxStore {
  MyStore();

  String phoneNumber = "";
  String role = "FARMER";
  String selectedCountryName = "Cameroon";

  List<String> genders = ["Male", "Female", "Other"];
  List<String> uomList = [];

  List<String> educationLevel = ["Graduate"];
  List<IdNameModel> territroy = [];
  List<IdNameModel> region = [];
  List<IdNameModel> county = [];
  List<IdNameModel> subcounty = [];
  List<IdNameModel> village = [];
  List<TerritoryModel> countries = [];

  Position? position;

  //crops
  List<CropModelShort> cropsListSelected = [];
  Map<String, List<CropModelShort>> cropsSignUp = {};

  //farmer main model
  Farmer? farmerMainModel;
  UserModel? user;
  TerritoryModel? selectedCountry;
  UserToken? userToken;

  List<StoreCardModel?> homeStoreList = [
    StoreCardModel(
        "Store 1",
        'https://cdn.pixabay.com/photo/2023/03/26/07/27/flower-7877708_640.jpg',
        21,
        false,
        4,
        ["Wheat"]),
  ];

  //TODO to remove
  List<FarmModel> farmItem = []; //profile, edit_profile

  //Final updates with api

  List<Message> socialMessageList = [];
  List<CropStage> cropStageList = [];
  List<Price> priceListFarmSupport = [];

  List<NameImageModel> popCards = []; //pop_card, pop_details
  List<PoPModel> savedPopList = []; //pop_saved, pop

  List<Cropselectfruit> cropselectfruit = []; //soil_test_selectcrops
  List<FertilizerCropDto> cropselect =
      []; // add_crop_input, soil_test_selectcrops
  List<FertilizerSourceCalculatorDetailsDto> fertilizerSourceCalculatorDetails =
      []; //fertilizer_combination

  List<CropCalendar> cropCalender = []; //farm_support_place, page_route

  List<CropStageCalendar> stageCalender = []; //farm_support_place, page_route
  List<FertilizerFruitCalculatorDetails> fertilizerFruitCalculatorDetailsList =
      []; //fertilizer_Calculator
  List<FertilizerCalculatorReportDto> fertilizerCalculatorReportDtoList =
      []; //fertilizer_Calculator
  TrendingTags? trendingTags; //farm_talk

  Message?
      message; //farmtalk_explore, farm_talk, farmtalk_home, farm_talk_my_posts,farm_talk_profile
  PopSectionModel?
      popSectionModel; //pop_details, climateRequirements, cultivators
  AdvisoryDetails? advisoryDetails; //my_queries_card
  AdvisoryTable? advisoryTable; //my_queries_card

  List<GlobalIndicatorDTO?> growthStagesList = [];

  //

  List<PoPModel> popList =
      []; //pop_controller, farm_support_place, pop_saved, pop
  List<CropAdvisoryModel> cropAdvisoriesList =
      []; //farm_support_place, crop_advisory

  List<FarmScouting> farmScoutingList = [],
      solvedFarmScoutingList = [],
      pendingFarmScoutingList = [];

  //my_queries_solved, my_queries_pending

  //weather
  WeatherData?
      weatherData; //farm_support_place, weather_today,weather_tomorrow, weather_7days

  //mycrops
  List<CropDto> myCrops = [];
  bool callFromMyCrops = false;
  List<String> myCropNames = [];
  List<String> myCropImages = [];

  //Diseases
  List<CropDto> cropList = []; //farm_support_place
  List<String> cropNameList = []; //farm_support_place
  List<String> cropImageList = []; //farm_support_place
  List<Disease> diseasesList = [];
  String selectedCropUuidForDiseaseFromMyCrops = "";

  /////////////////////////// MARKET PLACE /////////////////////////
  List<CategoryModel> rentalCategoryList = []; //marketplace_home
  List<OfferModel> rentalOfferList = []; //marketplace_home
  //For MarketPlace
  List<StoreModel> purchaseStoreList =
      []; //cart_page_home_delivery_order, cart_page_pickup_order, category_page, market_place_order_cancellation, marketplace_checkout, marketplace_home, marketplace_my_orders,marketplace_order_confirmed_detail, marketplace_order_detail
  List<PurchaseOrderModel> purchaseOrderList =
      []; //farm_marketplace, cart_page_home_delivery_order, cart_page_pickup_order, market_place_order_cancellation, marketplace_checkout, marketplace_my_orders, marketplace_order_confirmed_detail, marketplace_order_confirmed, marketplace_order_detail, marketplace_request_sent, rent_order_picked, rent_verification_page, soil_testing_order_detail

  List<ProductModel> rentalProductList = [];
  List<VariantModel> rentalVariantList = [];
  List<ReviewModel> rentalReviewList = [];
}
