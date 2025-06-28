const uploadImageUrl = "";

class ApiConstants {
  static String baseUrl = "https://devapifarmsanta.infoware.xyz";
  static String s3bucketName = "farmsantaassestsdev";

  //buckets

  static String s3ImageBaseUrl = "https://$s3bucketName"".s3.ap-south-1.amazonaws.com/";





  // authenticaiton
  static String baseUserService = "$baseUrl/user-service/";
  static String generateOtp = "$baseUserService/generate-otp";
  static String resetPassword = "$baseUserService/reset-password";
  static String sendResetOtp = "$baseUserService/send-reset-otp";
  static String validate = "$baseUserService/validate";
  // static String authenticate = "$baseUserService/authenticate";

  //farmer service
  static String baseFarmerService = "$baseUrl/farmer-service/";
  static String farmerProfile = "$baseFarmerService/farmer-profile";

  //master data service
  static String baseMasterService = "$baseUrl/master-data-service/";
  static String nameFieldRegion = "regionName";
  static String nameFieldCounty = "countyName";
  static String nameFieldSubCounty = "subcountyName";
  static String nameFieldVillage = "villageName";

  static String globalIndicatorsDetailsByGroup =
      "$baseMasterService/global-indicator-detail-by-group";
  static String unitOfMeasurementByType =
      "$baseMasterService/unitOfMeasurementByType/";
  static String languagesAll = "$baseMasterService/languages";
  static String countryAll = "$baseMasterService/country";

  static String crops = "$baseMasterService/crop";

  static List<String> idsNameUrls = [
    "$baseMasterService/territory",
    "$baseMasterService/find-region-by-territory-id/", //uuid of territory
    "$baseMasterService/county/region?regionid=", //=&
    "$baseMasterService/subcounty/county?countyid=", //&
    "$baseMasterService/village/subcounty?subcountyid=", //=&
  ];

  static List<String> stringNameUrls = [
    "$baseUrl$baseMasterService/unitOfMeasurement"
  ];

  //TODO make dynamic
  static String globalIndicatorForGender = "gender_ind";
  static String globalIndicatorForEducation = "education_ind";
  static String globalIndicatorForCropsDivision = "crop_division_ind";

  //new ones
  static String baseUserIdentifier = "$baseUrl/user/";
  static String basePopIdentifier = "$baseUrl/pop/";
  static String baseMsgIdentifier = "$baseUrl/message/";
  static String baseCommonData = "$baseUrl/common-data/";
  static String baseStorage = "$baseUrl/storage/cms/";
  static String basePopService = "$baseUrl/pop-service/";
  static String baseNewsService = "$baseUrl/news-service/";
  static String baseMarketPrice = "$baseUrl/market-price-service/";
  static String baseWeatherService = "$baseUrl/weather-service/";
  static String baseMessageService = "$baseUrl/farmer-talk-service/";
  static String baseStorageService = "$baseUrl/storage-service/";
  static String scoutPlantPart = "scout_plant_part";

  static String languageQueryParam = "?languageId=";

  static String cropCalendarIdentifier = "cropcalendar";
  static String addCropCalendar = baseMasterService + cropCalendarIdentifier;
  static String cropCalendarsByUserId =
      "${baseMasterService}cropcalendar-by-userid/";
  static String cropCalendarsAll =
      "${baseMasterService}cropcalendar-stage-active/";
  static String cropStageCalendarList =
      "${baseMasterService}cropcalendar-stage-list/";

  static String cropCalendarStagesIndicators =
      "${globalIndicatorsDetailsByGroup}crop_calendar_stages";

  static String farmerProfileSave =
      "${baseFarmerService}farmer-profile/farmer-profile-save";
  static String farmScouting = "${baseFarmerService}farm-scouting/";
  static String farmScoutingByLand =
      "${baseFarmerService}farm-scouting/farm-scouting-by-land";
  static String farmScoutingByFarmer =
      "${baseFarmerService}farm-scouting/farm-scouting-by-farmer";
  static String farmerGroups =
      "${baseFarmerService}api/user-group-master/v1/associated-user-groups";
  static String currentFarmer =
      "${baseFarmerService}farmer-profile/current-farmer-profile";
  static String updateFarmer = "${baseUserService}api/app/user";

  static String farmScoutingBySearch =
      "${farmScouting}farm-scouting/search?searchText=";

  static String cropDivisionGlobalIndicators =
      "${globalIndicatorsDetailsByGroup}crop_division_ind";
  static String educationLevelsGlobalIndicators =
      "${globalIndicatorsDetailsByGroup}education_ind";
  static String waterSourceGlobalIndicators =
      "${globalIndicatorsDetailsByGroup}water_source_ind";

  static String landUomGlobalIndicators =
      "${unitOfMeasurementByType}Land measurement";

  static String socialPost = "${baseMsgIdentifier}message";

  static String messageService = "${baseMessageService}message";
  static String messageServiceSave = "${baseMessageService}message-app";
  static String message = "${baseMessageService}message-by-location";
  static String messageById = "${baseMessageService}message/";
  static String mostLikedMessages =
      "${baseMessageService}message-by-location-most-like";
  static String mostCommentedMessages =
      "${baseMessageService}message-by-location-most-comment";
  static String myMessages = "${baseMessageService}my-message";
  static String likedMessage = "${baseMessageService}my-liked-message";
  static String commentedMessage = "${baseMessageService}my-commented-message";
  static String comment = "${baseMessageService}message-comment";
  static String commentDelete = "${baseMessageService}message-comment-delete";
  static String commentUpdate = "${baseMessageService}message-update";
  static String saveMessageLike = "${baseMessageService}message-like";
  static String saveMessageDislike = "${baseMessageService}message-dislike";
  static String searchMessages = "${baseMessageService}message/search/";

  static String getPopList = "${basePopIdentifier}pop";
  static String crop = "${basePopIdentifier}crop";
  static String getPopRecommendation = "${basePopIdentifier}recommendation";
  static String popSearch =
      "$basePopService${basePopIdentifier}search?searchText=";
  static String seedRate = "${basePopIdentifier}calculate";
  static String referenceData = "${basePopIdentifier}reference-data";
  static String popSections = "${basePopService}pop-sections/";
  static String croppingProcess =
      "${baseMasterService}cropping-process-cropid/";

  static String popService = "${basePopService}pop";
//static String popServiceUser = basePopService + "user-pop";
  static String popServiceUser = "${basePopService}pop-by-location";
  static String popBookmarkService = "${basePopService}bookmarked-pop";
  static String popBookmark = "${basePopService}bookmark";

  static String bookmark = "${baseUserIdentifier}bookmark";
  static String authenticate = "${baseUserService}authenticateV2";
  static String refreshToken = "${baseUserService}refresh/";
  static String currentUser = "${baseUserService}api/current-user";
  static String getBookmarks = "${basePopService}bookmark";
  static String getAllBookmarks = "${baseUserService}all-bookmarks";
  static String saveBookmark = "${baseUserService}bookmark";
  static String getBookmarkType =
      "${baseUserService}bookmarks/find-by-bookmarktype";
//static String deleteBookmark = baseUserService + "user-bookmark";
  static String deleteBookmark = "${baseUserService}bookmark";
  static String saveUser = "${baseUserService}api/user";
  static String userBookmark = "${baseCommonData}bookmarked-pop";
  static String myCropPop = "${baseCommonData}pop-for-farmer";
  static String cropGroup = "${baseCommonData}crop-group";
  static String popForGroup = "${baseCommonData}pop-for-group";
  static String socialMessages = "${baseCommonData}messages";
  static String seedRateCrops = "${baseCommonData}crop-for-seed-rate";
  static String userPop = "${baseCommonData}pop-for-farmer";
  static String userPopForGroup = "${baseCommonData}pop-for-group";

  static String newsFeed = "${baseNewsService}news";

  static String cultivarController = "${baseMasterService}cultivar";
  static String cropList = "${baseMasterService}crop";
  static String cropById = "$cropList/";
  static String cropsBySearch = "${baseMasterService}crop/search?cropName=";
  static String soilHealth = "${baseMasterService}soil-health";
  static String region = "${baseMasterService}region";
  static String regionByTerritory =
      "${baseMasterService}find-region-by-territory-id/";
  static String territory = "${baseMasterService}territory-with-phonecode";
  static String language = "${baseMasterService}languages";
  static String countyByRegion = "${baseMasterService}county/region";
  static String subCountyByCounty = "${baseMasterService}subcounty/county";
  static String allSubCountry = "${baseMasterService}subcounty";
  static String country = "${baseMasterService}country";
  static String villageBySubCounty = "${baseMasterService}village/subcounty";
  static String allVillages = "${baseMasterService}village";
  static String globalIndicatorDetail =
      "${baseMasterService}global-indicator-detail-by-group/";
  static String globalIndicators =
      "${baseMasterService}global-indicator-detail";
  static String cropAdvisory = "${baseMasterService}crop-advisory";
  static String cropAdvisoryByLocation =
      "${baseMasterService}crop-advisory-by-location";
  static String cropAdvisoryBySearch =
      "${baseMasterService}crop-advisory/search?searchText=";
  static String subscribePush =
      "${baseMasterService}cloud-message/subscribe-topics";
  static String notification = "${baseMasterService}notification";
  static String cropAdvisoryByScoutingId =
      "${baseFarmerService}farm-scouting/find-advisory-for-farm-scouting";
  static String cropStageByCropName =
      "${baseMasterService}crop-stage-by-crop-name";
  static String cropStageByCropId = "${baseMasterService}crop-stage-by-crop-id";
// static String cropStage = baseMasterService + "crop-stage";
  static String cropStage = "${globalIndicatorDetail}growth_stage_ind";
  static String scoutCategory =
      "${globalIndicatorDetail}scouting_img_category_ind";
  static String plantPart =
      globalIndicatorDetail + scoutPlantPart + languageQueryParam;
  static String cropRecommendation =
      "${baseMasterService}crop-specific-recommendation";
  static String trendingTags = "$messageService/trending-tag-by-location";
  static String gender = "${globalIndicatorDetail}gender_ind";
  static String disease = "${baseMasterService}disease";

  static final String growthStagesIndicators =
      "${globalIndicatorsDetailsByGroup}growth_stage_ind";

// Fertilizer APIs
  static final String fertilizerSourceDetails =
      "${baseMasterService}fertilizer-source-calculator-details/find-by-user-location";
  static final String fertilizerFruitCrops =
      "${baseMasterService}fertilizer-fruit-calculator-details/find-by-user-location";
  static final String fertilizerReportGenerate =
      "${baseMasterService}fertilizer-calculator/app/fertilizer-reportGenerater";
  static final String fertilizerSavedReports =
      "${baseMasterService}fertilizer-calculator-report/findByCurrentUser";
  static final String fertilizerFruitCalculatorDetails =
      "${baseMasterService}fertilizer-fruit-calculator-details";
  static final String fertilizerCropsByLocation =
      "${baseMasterService}fertilizer-calculator/crop-by-location";

  static final String fertilizerCropsByLocationV2 =
      "${baseMasterService}fertilizer-calculatorV2/crop-by-location";

  static final String priceFeed = "${baseMarketPrice}marketPriceByLocation";
  static final String marketData = "${baseMarketPrice}marketPriceByDay?";

  static String weatherFeed = "${baseWeatherService}weather-by-zipcode";
  static final String weatherFeedLand =
      "${baseWeatherService}weather-for-location/";
  static final String weatherFeedLandUpdates =
      "${baseMasterService}weather-latest-updates";

// get farm scouting URL
  static String imageBaseUrl = "https://storage.googleapis.com/fs-cms-media/";

  static String chat = "https://b25f7e159195.ngrok.io/" "chatbot";
  static String uploadFarmScoutPic = "${baseStorage}upload-media";

  // TODO: add farm scout URL to image
  static String uploadProfilePic = "${baseStorage}upload-media";

  static String waterSourceGroup = "water_source_ind";
  static String advisoryGroup = "crop_advisory_tag_ind";
  static String cultivarType = "cultivar_type_ind";
  static String cultivarDuration = "cultivar_maturity_ind";
}
