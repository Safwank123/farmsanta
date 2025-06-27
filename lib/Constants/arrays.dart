
import 'package:farmsanta_new/Models/MarketPlace/review_model.dart';
import 'package:farmsanta_new/Models/MarketPlace/store_model.dart';

import '../Models/Common/cardmodel.dart';
import '../Models/Common/crop_model.dart';
import '../Models/Common/farm_model.dart';
import '../Models/MarketPlace/Purchase/purchase_order_model.dart';
import '../Models/MarketPlace/Rental/rental_order_model.dart';
import '../Models/MarketPlace/SoilTesting/lab_model.dart';
import '../Models/MarketPlace/SoilTesting/soil_test_booking_model.dart';
import '../Models/MarketPlace/category_model.dart';
import '../Models/MarketPlace/offer_model.dart';
import '../Models/MarketPlace/product_model.dart';
import '../Models/MarketPlace/variant_model.dart';
import '../Models/SupportPlace/CropAdvisory/crop_advisory_model.dart';
import '../Models/SupportPlace/farmscout/advisory_details.dart';
import '../Models/SupportPlace/farmscout/advisory_table.dart';
import '../Models/message/message.dart';
import '../Models/tags/trendingTags.dart';
import '../Models/SupportPlace/CropCalender/CropCalender.dart';
import '../Models/SupportPlace/CropCalender/CropStageCalendar.dart';
import '../Models/SupportPlace/Disease/Disease.dart';
import '../Models/SupportPlace/master/CropMaster.dart';
import '../Models/SupportPlace/calculator/FertilizerSourceDetails.dart';
import '../Models/SupportPlace/calculator/FertilizerGeneratedReport.dart';
import '../Models/SupportPlace/calculator/fertilizer_crop_controller_model.dart';
import '../Models/SupportPlace/calculator/fertilizer_fruit_calculator.dart';
import '../Models/SupportPlace/calculator/fertilizer_fruit_calculator_details.dart';
import '../Models/SupportPlace/POP/PopDetailsDTO.dart';
import '../Models/SupportPlace/POP/PopDto.dart';
import '../Models/SupportPlace/farmscout/farm_scouting.dart';
import '../Routes/image_routes.dart';
import '../Services/store_helper.dart';
import 'strings.dart';

//language
class LanguageData {
  static List<String> languageCodes = ["en", "hi"];
  static List<String> languageNames = ["English", "Hindi"];
}

//Crop list
List<List<dynamic>> croplist = [
  [
    'https://cdn.shopify.com/s/files/1/0047/9730/0847/products/nurserylive-seeds-coriander-imported-herb-seeds-16969067036812.jpg?v=1634203694',
    AppStrings.coriander,
  ],
  [
    'https://cdn.shopify.com/s/files/1/0047/9730/0847/products/nurserylive-seeds-coriander-imported-herb-seeds-16969067036812.jpg?v=1634203694',
    AppStrings.coriander,
  ],
];
//Edit Profile
List<List<dynamic>> list = [
  [
    'https://cdn.shopify.com/s/files/1/0047/9730/0847/products/nurserylive-seeds-coriander-imported-herb-seeds-16969067036812.jpg?v=1634203694',
    AppStrings.name,
    'John Doe'
  ],
  [
    'https://cdn.shopify.com/s/files/1/0047/9730/0847/products/nurserylive-seeds-coriander-imported-herb-seeds-16969067036812.jpg?v=1634203694',
    AppStrings.mobileNumber,
    '8149284177'
  ],
  [
    'https://cdn.shopify.com/s/files/1/0047/9730/0847/products/nurserylive-seeds-coriander-imported-herb-seeds-16969067036812.jpg?v=1634203694',
    AppStrings.dateOfBirth,
    '20/01/1997'
  ],
  [
    'https://cdn.shopify.com/s/files/1/0047/9730/0847/products/nurserylive-seeds-coriander-imported-herb-seeds-16969067036812.jpg?v=1634203694',
    AppStrings.education,
    'B.Pharm'
  ],
  [
    'https://cdn.shopify.com/s/files/1/0047/9730/0847/products/nurserylive-seeds-coriander-imported-herb-seeds-16969067036812.jpg?v=1634203694',
    AppStrings.gender,
    'Male'
  ],
  [
    'https://cdn.shopify.com/s/files/1/0047/9730/0847/products/nurserylive-seeds-coriander-imported-herb-seeds-16969067036812.jpg?v=1634203694',
    AppStrings.datasource,
    'Mobile'
  ],
  [
    'https://cdn.shopify.com/s/files/1/0047/9730/0847/products/nurserylive-seeds-coriander-imported-herb-seeds-16969067036812.jpg?v=1634203694',
    AppStrings.haveSmartphone,
    'True'
  ],
];

//Dummy model data for all Diseases of Spinach
//which will be found through API by passing UUID of crop
//API used for this DiseaseController {/master-data-service/disease-crop/{cropId}}

//dummy Calender StageModelList
List<CropStageCalendar> stageCalender = [
  //For One Crop
  CropStageCalendar.fromJson({
    "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
    "stageName": "Pre-Seedling Stage",
    "stageStatus": 1,
    "stageWeek": "0 - 1",
    "isCurrentTask": false,
    "stageList": [
      {
        "id": 358,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "6419a82a-aab5-4fe1-b00e-5adeba26e236",
        "weekInfo": -4,
        "tasklist": [
          {
            "id": 278,
            "oprationName": "Pre-seedling", //Stage Name
            "oprationDescription":
                "Do not use excess fertilizers. Add fertilizers/nutrients in the field as per soil test report and save your farmland as well as money. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Think before crop planing "
          },
          {
            "id": 282,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Avoid late sowing as this may lead to reduce yields and increase incidence of diseases. In case of late sowing, select short or medium duation varieties. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 6,
            "status": true,
            "oprationType": "Think before crop planing "
          },
          {
            "id": 284,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Pre-emergence as well as soil incorporated herbicides should not be applied in dry soils. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 8,
            "status": true,
            "oprationType": "Think before crop planing "
          },
          {
            "id": 285,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Please go for soil testing at least 4 weeks before the sowing. After harvesting of the crop remove crop resiudes at the soil sampling spot and dig the soil in V shaped hole with the depth of 15-20 cm. collect the samples from all the corners and middle of the field and mix them well after that take 500 g soil sample and get it tested in soil test laboratory near by which will give you informatation about various soil parameters like pH, N, P, K and micro nutrients. Determine fertilizer requirements based on the test values and crop type.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 9,
            "status": true,
            "oprationType": "Soil testing"
          },
          {
            "id": 283,
            "oprationName": "Pre-seedling",
            "oprationDescription": "Do not sow seeds beyond 4 cm depth.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 7,
            "status": true,
            "oprationType": "Think before crop planing "
          },
          {
            "id": 281,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Do not use seeds without seed treatment, treat with biocides/chemicals.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 5,
            "status": true,
            "oprationType": "Think before crop planing "
          },
          {
            "id": 277,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "After harvesting of existing crop, take 500 g soil sample of the field and go to nearby Government/ private soil laboratory for soil testing or ask to FarmSanta for the same and collect own soil test report from the laboratory.\n\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Think before crop planing "
          },
          {
            "id": 279,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Do not plant or irrigate the field after ploughing, at least for 2-3 weeks, to allow desiccation of weed's bulbs or rhizomes of weeds.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 3,
            "status": true,
            "oprationType": "Think before crop planing "
          },
          {
            "id": 280,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Avoid mono cropping and do not grow varieties not suitable for the season/ region. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 4,
            "status": true,
            "oprationType": "Think before crop planing "
          }
        ],
        "languageId": 1
      },
      {
        "id": 359,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "6419a82a-aab5-4fe1-b00e-5adeba26e236",
        "weekInfo": -3,
        "tasklist": [
          {
            "id": 286,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "To know more details about seed selection, please go to cultivar section of FarmSanta App.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Cultivar selection"
          },
          {
            "id": 287,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Greengram prefers a warm and moist climate which favours faster seed germination and seedling emergence. An optimum mean daily temperature around 25-35°C promotes its growth. At the time of sowing, the ambient temperature should be of 25-30°C for proper germination. It can thrive well with a rainfall distribution ranging between 600 to 900 mm. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Climatic requirements"
          },
          {
            "id": 288,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Greengram can be sown during middle of February to middle of March in summer season and with the onset of the monsoon in kharif season.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 3,
            "status": true,
            "oprationType": "Sowing window"
          }
        ],
        "languageId": 1
      },
      {
        "id": 360,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "6419a82a-aab5-4fe1-b00e-5adeba26e236",
        "weekInfo": -2,
        "tasklist": [
          {
            "id": 289,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Plough the land once or twice after harvesting of previous crop to get pulverised soil of good tilth. Use harrow to remove the clods. Irrigate the land one at the time of land preparation in absense of rainfall. Apply 25 tonnes/ha FYM or well decomposed cow dung 1 month before sowing to improve the soil structure along with root development.  \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Field preparation"
          },
          {
            "id": 290,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "To know more details about fertilizer dosage recommendation go to FarmSanta fertilizer calculator.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Fertilizer requirements"
          },
          {
            "id": 291,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Follow line sowing to facilitate  interculture operatons in a proper way.\nSpacing is imporatant to maintain air cirulation and allow more penetraion of the sunlight in the canopy. Maintain sowing at a depth of 3 cm in heavy soils and 4 cm in light soils. \nThe optimal seed rate required for greengram cultivation is 20-25 kg/ha with a spacing of 30 cm x 10 cm. \n\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 3,
            "status": true,
            "oprationType": "Sowing method"
          }
        ],
        "languageId": 1
      },
      {
        "id": 361,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "6419a82a-aab5-4fe1-b00e-5adeba26e236",
        "weekInfo": -1,
        "tasklist": [
          {
            "id": 294,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Treat the seeds with 3 packets (600 g/ha) of Rhizobial culture and 3 packets (600 g/ha)  of Phosphobacteria. If the seed treatment is not carried out apply 10 packets of Rhizobium (2kg/ha)  and 10 packets (2kg/ ha)  of Phosphobacteria with 25 kg of FYM or 25 kg of soil before sowing.  Dry the bacterial culture treated seeds in shade for 15 minutes before sowing.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 3,
            "status": true,
            "oprationType": "Seed treatment (Org.)"
          },
          {
            "id": 293,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "To control any seed borne pathogens, seeds should be treated with Thiram or Captan @ 2 to 3 g/kg of\nseeds 24 hours before sowing.  To protect from insect seed should be treated with Imidacloprid 70% DS 3-4 g per kg of seed. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Seed treatment "
          },
          {
            "id": 292,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Land preparation at this stage serves a duo purpose of eradicating weeds and having a fine tilth with another one ploughing. Planking should be done for proper levelling of the land. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Field preparation"
          }
        ],
        "languageId": 1
      },
      {
        "id": 362,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "adb7d4aa-206f-449c-bfb3-f57336a13aff",
        "weekInfo": 1,
        "tasklist": [
          {
            "id": 295,
            "oprationName": "Seedling",
            "oprationDescription":
                "Apply the recommended dose of fertilizers before sowing. For the standard recommendation of fertilizers for Greengram, go to FarmSanta app. Sow the seeds with a seed-drill keeping in mind the plant spacing as prescribed. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Sowing"
          },
          {
            "id": 297,
            "oprationName": "Seedling",
            "oprationDescription":
                "To control weed chemically, within two days after sowing, spray Pendimethalin @800 ml/acre in 150-200 L of water. To keep field weed free, two hoeing are required, give first hoeing 20 days after sowing and second hoeing 40 days after sowing.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 3,
            "status": true,
            "oprationType": "Weeding"
          },
          {
            "id": 296,
            "oprationName": "Seedling",
            "oprationDescription":
                "For rainfed crop, irrigation is not required. However, drainage is essential because of the susceptibility of greengram to waterlogging.\nFor summer crop, 4-5 irrigations may be applied. Give  the 1st irrigation at 10-12 DAS if there is no rainfall. Subsequent irrigations should be applied at an interval of 7-10 days depending upon the rainfall. Sufficient soil moisture should be present particularly during flower initiation and pod development for better yield and quality of greengram. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Irrigation"
          }
        ],
        "languageId": 1
      },
      {
        "id": 363,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "adb7d4aa-206f-449c-bfb3-f57336a13aff",
        "weekInfo": 2,
        "tasklist": [
          {
            "id": 298,
            "oprationName": "Seedling",
            "oprationDescription":
                "Check soil moisture and irrigate the field, if required.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Irrigation"
          },
          {
            "id": 299,
            "oprationName": "Seedling",
            "oprationDescription":
                "If Aphids or Thrips or leaf spots or Anthracnose are detected, please go to FarmSanta app for more details.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Monitor your farm"
          }
        ],
        "languageId": 1
      },
      {
        "id": 364,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "7ece6362-2913-4fd5-a581-aed89e980249",
        "weekInfo": 3,
        "tasklist": [
          {
            "id": 300,
            "oprationName": "Vegetative",
            "oprationDescription":
                "Manual weed control should be done.  Along with that, thinning should be followed after germination to facilitate optimum plant growth with an optimum plant population.\n\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Weeding"
          },
          {
            "id": 301,
            "oprationName": "Vegetative",
            "oprationDescription":
                "If Yellow vein mosaic viral disease is detected, please go to FarmSanta app for more details.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Monitor your farm"
          }
        ],
        "languageId": 1
      },
      {
        "id": 365,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "7ece6362-2913-4fd5-a581-aed89e980249",
        "weekInfo": 4,
        "tasklist": [
          {
            "id": 302,
            "oprationName": "Vegetative",
            "oprationDescription":
                "Check soil moisture and irrigate the field, if required.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Irrigation"
          },
          {
            "id": 304,
            "oprationName": "Vegetative",
            "oprationDescription":
                "If Bihar hairy caterpillars or white flies are identified, please go to FarmSanta app for more details.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 3,
            "status": true,
            "oprationType": "Monitor your farm"
          },
          {
            "id": 303,
            "oprationName": "Vegetative",
            "oprationDescription":
                "Monitor the field regularly for sign of nutrient deficiencies during the season. \nSpray 20 g urea, 5g NPK, 5 g  Zn sulfate, 1 g Borax and 10 g Fe sulfate per L of water at this stage of pre-flowering as per requirement. Ask farmSanta Agronomist or local retailer which micronutrient is best suited for your crop. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Foliar application"
          }
        ],
        "languageId": 1
      },
      {
        "id": 366,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "b9f4bc95-fff7-484d-93b9-2d6bb0dc7d69",
        "weekInfo": 5,
        "tasklist": [
          {
            "id": 305,
            "oprationName": "Flowering",
            "oprationDescription":
                "Check soil moisture and irrigate the field, if required.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Irrigation"
          },
          {
            "id": 306,
            "oprationName": "Flowering",
            "oprationDescription":
                "If necessary, go for a 2nd spray with 20 g urea, 5g NPK, 5 g  Zn sulfate and/or 1 g Borax and/or 10 g Fe sulfate per L of water for better flower to pod conversion. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Foliar application"
          }
        ],
        "languageId": 1
      },
      {
        "id": 367,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "b9f4bc95-fff7-484d-93b9-2d6bb0dc7d69",
        "weekInfo": 6,
        "tasklist": [
          {
            "id": 307,
            "oprationName": "Flowering",
            "oprationDescription":
                "If, hairy caterpillars or root rot or wilt are found, please go to FarmSanta app for more details.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Monitor your farm"
          }
        ],
        "languageId": 1
      },
      {
        "id": 368,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "75035e60-3223-4d66-bcca-3b0fd1eb57bc",
        "weekInfo": 7,
        "tasklist": [
          {
            "id": 308,
            "oprationName": "Pod Development",
            "oprationDescription":
                "If pod borers or white flies or damping off or root rot are found, please go to FarmSanta app for more details.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Monitor your farm"
          }
        ],
        "languageId": 1
      },
      {
        "id": 369,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "75035e60-3223-4d66-bcca-3b0fd1eb57bc",
        "weekInfo": 8,
        "tasklist": [
          {
            "id": 309,
            "oprationName": "Pod Development",
            "oprationDescription":
                "Check soil moisture and irrigate the field, if needed.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Irrigation"
          }
        ],
        "languageId": 1
      },
      {
        "id": 370,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "a4d5bd78-a5e3-446c-adee-5d142e83bdd2",
        "weekInfo": 9,
        "tasklist": [
          {
            "id": 310,
            "oprationName": "Harvesting",
            "oprationDescription":
                "Harvesting may be done from 9th week onwards depending upon the variety. Most Greengram varieties are harvested within a period of 60-70 days after planting.  Timely harvesting of seed minimizes seed deterioration in the field, infestation by insects and losses from physical damage. Delayed harvesting may cause the pods to start shattering in susceptible varieties leading to yield loss.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Time to harvest"
          },
          {
            "id": 311,
            "oprationName": "Harvesting",
            "oprationDescription":
                "Manual harvesting method is suitable for small areas, where a large labour force is readily available. Hand harvesting is suitable for green pod and seed production. The usual system of hand harvesting is to allow labourers to cut or pull as much plant material as they can thresh in a day.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Harvesting"
          }
        ],
        "languageId": 1
      },
      {
        "id": 371,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "2d0d28d4-ac64-4a0a-8513-b518a17b2c1e",
        "weekInfo": 10,
        "tasklist": [
          {
            "id": 312,
            "oprationName": "Post-Harvesting",
            "oprationDescription":
                "Threshing can be done manually or mechanically. At threshing, the seed should have a moisture content of 14-15%. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Threshing"
          },
          {
            "id": 313,
            "oprationName": "Post-Harvesting",
            "oprationDescription":
                "The seed should be dried on clean tarpaulins to avoid soiling and contamination. Proper drying of seed reduces storage losses. Preserve the seeds in a stable environment with a constant temprature and moisture. The starting moisture for seeds should be 10-12% and the storage temprature should 20-30 ̊C. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Drying"
          }
        ],
        "languageId": 1
      },
      {
        "id": 372,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "72781074-ba83-4558-9d83-dfa50561cd19",
        "weekInfo": 11,
        "tasklist": [
          {
            "id": 315,
            "oprationName": "Storage",
            "oprationDescription":
                "Seed should be dried before storage so that its viability can be maintained during the storage period. Greengram should be stored at a moisture content of 5-8% or less for longer storage. Seed is sufficiently dry when it cannot be dented with the teeth or fingernails. The seed should be stored on raised platforms, in a dry cool place.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Storing"
          },
          {
            "id": 314,
            "oprationName": "Storage",
            "oprationDescription":
                "Seed should be graded according to variety and quality. Also remove all impurities, including inert matter and weed seeds. After the seed has been cleaned, it should be weighed and packed. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Storing"
          }
        ],
        "languageId": 1
      }
    ]
  }),
  CropStageCalendar.fromJson({
    "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
    "stageName": "Field Preparation",
    "stageStatus": 1,
    "stageWeek": "2 - 3",
    "isCurrentTask": false,
    "stageList": [
      {
        "id": 358,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "6419a82a-aab5-4fe1-b00e-5adeba26e236",
        "weekInfo": -4,
        "tasklist": [
          {
            "id": 278,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Do not use excess fertilizers. Add fertilizers/nutrients in the field as per soil test report and save your farmland as well as money. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Think before crop planing "
          },
          {
            "id": 282,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Avoid late sowing as this may lead to reduce yields and increase incidence of diseases. In case of late sowing, select short or medium duation varieties. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 6,
            "status": true,
            "oprationType": "Think before crop planing "
          },
          {
            "id": 284,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Pre-emergence as well as soil incorporated herbicides should not be applied in dry soils. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 8,
            "status": true,
            "oprationType": "Think before crop planing "
          },
          {
            "id": 285,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Please go for soil testing at least 4 weeks before the sowing. After harvesting of the crop remove crop resiudes at the soil sampling spot and dig the soil in V shaped hole with the depth of 15-20 cm. collect the samples from all the corners and middle of the field and mix them well after that take 500 g soil sample and get it tested in soil test laboratory near by which will give you informatation about various soil parameters like pH, N, P, K and micro nutrients. Determine fertilizer requirements based on the test values and crop type.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 9,
            "status": true,
            "oprationType": "Soil testing"
          },
          {
            "id": 283,
            "oprationName": "Pre-seedling",
            "oprationDescription": "Do not sow seeds beyond 4 cm depth.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 7,
            "status": true,
            "oprationType": "Think before crop planing "
          },
          {
            "id": 281,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Do not use seeds without seed treatment, treat with biocides/chemicals.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 5,
            "status": true,
            "oprationType": "Think before crop planing "
          },
          {
            "id": 277,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "After harvesting of existing crop, take 500 g soil sample of the field and go to nearby Government/ private soil laboratory for soil testing or ask to FarmSanta for the same and collect own soil test report from the laboratory.\n\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Think before crop planing "
          },
          {
            "id": 279,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Do not plant or irrigate the field after ploughing, at least for 2-3 weeks, to allow desiccation of weed's bulbs or rhizomes of weeds.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 3,
            "status": true,
            "oprationType": "Think before crop planing "
          },
          {
            "id": 280,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Avoid mono cropping and do not grow varieties not suitable for the season/ region. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 4,
            "status": true,
            "oprationType": "Think before crop planing "
          }
        ],
        "languageId": 1
      },
      {
        "id": 359,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "6419a82a-aab5-4fe1-b00e-5adeba26e236",
        "weekInfo": -3,
        "tasklist": [
          {
            "id": 286,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "To know more details about seed selection, please go to cultivar section of FarmSanta App.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Cultivar selection"
          },
          {
            "id": 287,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Greengram prefers a warm and moist climate which favours faster seed germination and seedling emergence. An optimum mean daily temperature around 25-35°C promotes its growth. At the time of sowing, the ambient temperature should be of 25-30°C for proper germination. It can thrive well with a rainfall distribution ranging between 600 to 900 mm. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Climatic requirements"
          },
          {
            "id": 288,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Greengram can be sown during middle of February to middle of March in summer season and with the onset of the monsoon in kharif season.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 3,
            "status": true,
            "oprationType": "Sowing window"
          }
        ],
        "languageId": 1
      },
      {
        "id": 360,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "6419a82a-aab5-4fe1-b00e-5adeba26e236",
        "weekInfo": -2,
        "tasklist": [
          {
            "id": 289,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Plough the land once or twice after harvesting of previous crop to get pulverised soil of good tilth. Use harrow to remove the clods. Irrigate the land one at the time of land preparation in absense of rainfall. Apply 25 tonnes/ha FYM or well decomposed cow dung 1 month before sowing to improve the soil structure along with root development.  \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Field preparation"
          },
          {
            "id": 290,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "To know more details about fertilizer dosage recommendation go to FarmSanta fertilizer calculator.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Fertilizer requirements"
          },
          {
            "id": 291,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Follow line sowing to facilitate  interculture operatons in a proper way.\nSpacing is imporatant to maintain air cirulation and allow more penetraion of the sunlight in the canopy. Maintain sowing at a depth of 3 cm in heavy soils and 4 cm in light soils. \nThe optimal seed rate required for greengram cultivation is 20-25 kg/ha with a spacing of 30 cm x 10 cm. \n\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 3,
            "status": true,
            "oprationType": "Sowing method"
          }
        ],
        "languageId": 1
      },
      {
        "id": 361,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "6419a82a-aab5-4fe1-b00e-5adeba26e236",
        "weekInfo": -1,
        "tasklist": [
          {
            "id": 294,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Treat the seeds with 3 packets (600 g/ha) of Rhizobial culture and 3 packets (600 g/ha)  of Phosphobacteria. If the seed treatment is not carried out apply 10 packets of Rhizobium (2kg/ha)  and 10 packets (2kg/ ha)  of Phosphobacteria with 25 kg of FYM or 25 kg of soil before sowing.  Dry the bacterial culture treated seeds in shade for 15 minutes before sowing.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 3,
            "status": true,
            "oprationType": "Seed treatment (Org.)"
          },
          {
            "id": 293,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "To control any seed borne pathogens, seeds should be treated with Thiram or Captan @ 2 to 3 g/kg of\nseeds 24 hours before sowing.  To protect from insect seed should be treated with Imidacloprid 70% DS 3-4 g per kg of seed. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Seed treatment "
          },
          {
            "id": 292,
            "oprationName": "Pre-seedling",
            "oprationDescription":
                "Land preparation at this stage serves a duo purpose of eradicating weeds and having a fine tilth with another one ploughing. Planking should be done for proper levelling of the land. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Field preparation"
          }
        ],
        "languageId": 1
      },
      {
        "id": 362,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "adb7d4aa-206f-449c-bfb3-f57336a13aff",
        "weekInfo": 1,
        "tasklist": [
          {
            "id": 295,
            "oprationName": "Seedling",
            "oprationDescription":
                "Apply the recommended dose of fertilizers before sowing. For the standard recommendation of fertilizers for Greengram, go to FarmSanta app. Sow the seeds with a seed-drill keeping in mind the plant spacing as prescribed. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Sowing"
          },
          {
            "id": 297,
            "oprationName": "Seedling",
            "oprationDescription":
                "To control weed chemically, within two days after sowing, spray Pendimethalin @800 ml/acre in 150-200 L of water. To keep field weed free, two hoeing are required, give first hoeing 20 days after sowing and second hoeing 40 days after sowing.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 3,
            "status": true,
            "oprationType": "Weeding"
          },
          {
            "id": 296,
            "oprationName": "Seedling",
            "oprationDescription":
                "For rainfed crop, irrigation is not required. However, drainage is essential because of the susceptibility of greengram to waterlogging.\nFor summer crop, 4-5 irrigations may be applied. Give  the 1st irrigation at 10-12 DAS if there is no rainfall. Subsequent irrigations should be applied at an interval of 7-10 days depending upon the rainfall. Sufficient soil moisture should be present particularly during flower initiation and pod development for better yield and quality of greengram. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Irrigation"
          }
        ],
        "languageId": 1
      },
      {
        "id": 363,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "adb7d4aa-206f-449c-bfb3-f57336a13aff",
        "weekInfo": 2,
        "tasklist": [
          {
            "id": 298,
            "oprationName": "Seedling",
            "oprationDescription":
                "Check soil moisture and irrigate the field, if required.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Irrigation"
          },
          {
            "id": 299,
            "oprationName": "Seedling",
            "oprationDescription":
                "If Aphids or Thrips or leaf spots or Anthracnose are detected, please go to FarmSanta app for more details.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Monitor your farm"
          }
        ],
        "languageId": 1
      },
      {
        "id": 364,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "7ece6362-2913-4fd5-a581-aed89e980249",
        "weekInfo": 3,
        "tasklist": [
          {
            "id": 300,
            "oprationName": "Vegetative",
            "oprationDescription":
                "Manual weed control should be done.  Along with that, thinning should be followed after germination to facilitate optimum plant growth with an optimum plant population.\n\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Weeding"
          },
          {
            "id": 301,
            "oprationName": "Vegetative",
            "oprationDescription":
                "If Yellow vein mosaic viral disease is detected, please go to FarmSanta app for more details.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Monitor your farm"
          }
        ],
        "languageId": 1
      },
      {
        "id": 365,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "7ece6362-2913-4fd5-a581-aed89e980249",
        "weekInfo": 4,
        "tasklist": [
          {
            "id": 302,
            "oprationName": "Vegetative",
            "oprationDescription":
                "Check soil moisture and irrigate the field, if required.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Irrigation"
          },
          {
            "id": 304,
            "oprationName": "Vegetative",
            "oprationDescription":
                "If Bihar hairy caterpillars or white flies are identified, please go to FarmSanta app for more details.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 3,
            "status": true,
            "oprationType": "Monitor your farm"
          },
          {
            "id": 303,
            "oprationName": "Vegetative",
            "oprationDescription":
                "Monitor the field regularly for sign of nutrient deficiencies during the season. \nSpray 20 g urea, 5g NPK, 5 g  Zn sulfate, 1 g Borax and 10 g Fe sulfate per L of water at this stage of pre-flowering as per requirement. Ask farmSanta Agronomist or local retailer which micronutrient is best suited for your crop. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Foliar application"
          }
        ],
        "languageId": 1
      },
      {
        "id": 366,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "b9f4bc95-fff7-484d-93b9-2d6bb0dc7d69",
        "weekInfo": 5,
        "tasklist": [
          {
            "id": 305,
            "oprationName": "Flowering",
            "oprationDescription":
                "Check soil moisture and irrigate the field, if required.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Irrigation"
          },
          {
            "id": 306,
            "oprationName": "Flowering",
            "oprationDescription":
                "If necessary, go for a 2nd spray with 20 g urea, 5g NPK, 5 g  Zn sulfate and/or 1 g Borax and/or 10 g Fe sulfate per L of water for better flower to pod conversion. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Foliar application"
          }
        ],
        "languageId": 1
      },
      {
        "id": 367,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "b9f4bc95-fff7-484d-93b9-2d6bb0dc7d69",
        "weekInfo": 6,
        "tasklist": [
          {
            "id": 307,
            "oprationName": "Flowering",
            "oprationDescription":
                "If, hairy caterpillars or root rot or wilt are found, please go to FarmSanta app for more details.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Monitor your farm"
          }
        ],
        "languageId": 1
      },
      {
        "id": 368,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "75035e60-3223-4d66-bcca-3b0fd1eb57bc",
        "weekInfo": 7,
        "tasklist": [
          {
            "id": 308,
            "oprationName": "Pod Development",
            "oprationDescription":
                "If pod borers or white flies or damping off or root rot are found, please go to FarmSanta app for more details.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Monitor your farm"
          }
        ],
        "languageId": 1
      },
      {
        "id": 369,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "75035e60-3223-4d66-bcca-3b0fd1eb57bc",
        "weekInfo": 8,
        "tasklist": [
          {
            "id": 309,
            "oprationName": "Pod Development",
            "oprationDescription":
                "Check soil moisture and irrigate the field, if needed.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Irrigation"
          }
        ],
        "languageId": 1
      },
      {
        "id": 370,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "a4d5bd78-a5e3-446c-adee-5d142e83bdd2",
        "weekInfo": 9,
        "tasklist": [
          {
            "id": 310,
            "oprationName": "Harvesting",
            "oprationDescription":
                "Harvesting may be done from 9th week onwards depending upon the variety. Most Greengram varieties are harvested within a period of 60-70 days after planting.  Timely harvesting of seed minimizes seed deterioration in the field, infestation by insects and losses from physical damage. Delayed harvesting may cause the pods to start shattering in susceptible varieties leading to yield loss.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Time to harvest"
          },
          {
            "id": 311,
            "oprationName": "Harvesting",
            "oprationDescription":
                "Manual harvesting method is suitable for small areas, where a large labour force is readily available. Hand harvesting is suitable for green pod and seed production. The usual system of hand harvesting is to allow labourers to cut or pull as much plant material as they can thresh in a day.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Harvesting"
          }
        ],
        "languageId": 1
      },
      {
        "id": 371,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "2d0d28d4-ac64-4a0a-8513-b518a17b2c1e",
        "weekInfo": 10,
        "tasklist": [
          {
            "id": 312,
            "oprationName": "Post-Harvesting",
            "oprationDescription":
                "Threshing can be done manually or mechanically. At threshing, the seed should have a moisture content of 14-15%. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Threshing"
          },
          {
            "id": 313,
            "oprationName": "Pod Development",
            "oprationDescription":
                "The seed should be dried on clean tarpaulins to avoid soiling and contamination. Proper drying of seed reduces storage losses. Preserve the seeds in a stable environment with a constant temprature and moisture. The starting moisture for seeds should be 10-12% and the storage temprature should 20-30 ̊C. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Drying"
          }
        ],
        "languageId": 1
      },
      {
        "id": 372,
        "userId": null,
        "status": true,
        "cropId": "0beb121f-4f4f-46aa-99d3-92ecb4600fe0",
        "stageName": "72781074-ba83-4558-9d83-dfa50561cd19",
        "weekInfo": 11,
        "tasklist": [
          {
            "id": 315,
            "oprationName": "Storage",
            "oprationDescription":
                "Seed should be dried before storage so that its viability can be maintained during the storage period. Greengram should be stored at a moisture content of 5-8% or less for longer storage. Seed is sufficiently dry when it cannot be dented with the teeth or fingernails. The seed should be stored on raised platforms, in a dry cool place.\n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 2,
            "status": true,
            "oprationType": "Storing"
          },
          {
            "id": 314,
            "oprationName": "Storage",
            "oprationDescription":
                "Seed should be graded according to variety and quality. Also remove all impurities, including inert matter and weed seeds. After the seed has been cleaned, it should be weighed and packed. \n",
            "taskImages": [
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg",
              "https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg"
            ],
            "taskSequance": 1,
            "status": true,
            "oprationType": "Storing"
          }
        ],
        "languageId": 1
      }
    ]
  })
];

// Dummy data for model fertilizer fruit calculator details
List<FertilizerFruitCalculatorDetails> fertilizerFruitCalculatorDetailsList = [
  FertilizerFruitCalculatorDetails.fromJson({
    "areaPerPlant": 10.5,
    "boneMeal": 2.5,
    "boraxB": 1.8,
    "cropName": "Apple",
    "diAluminiumPhosphatDAP": 3.2,
    "fym": 5.5,
    "id": 1,
    "limeL": 2.0,
    "muriateOfPotashMOP": 1.0,
    "neemKaranjCake": 0.5,
    "planting": 2023,
    "priority": 1,
    "procedureNotes": "Apply fertilizer once every month",
    "status": true,
    "territory": "ABC123",
    "ureaU": 4.5,
    "zincSulphate": 0.8
  }),
  FertilizerFruitCalculatorDetails.fromJson({
    "areaPerPlant": 10.5,
    "boneMeal": 2.5,
    "boraxB": 1.8,
    "cropName": "Apple",
    "diAluminiumPhosphatDAP": 3.2,
    "fym": 5.5,
    "id": 1,
    "limeL": 2.0,
    "muriateOfPotashMOP": 1.0,
    "neemKaranjCake": 0.5,
    "planting": 2023,
    "priority": 1,
    "procedureNotes": "Apply fertilizer once every month",
    "status": true,
    "territory": "ABC123",
    "ureaU": 4.5,
    "zincSulphate": 0.8
  }),
];

//For User's Previously Calculated Fertiliser
List<FertilizerCalculatorReportDto> fertilizerCalculatorReportDtoList = [
  FertilizerCalculatorReportDto.fromJson({
    "ageOfPlant": 2,
    "area": 1000,
    "boronFertilizer": 50,
    "borronB": 40,
    "borronLevelB": 30,
    "createdBy": "John Doe",
    "createdTimestamp": "2023-06-06T10:00:00Z",
    "cropId": "12345",
    "cropPriority": 1,
    "cropType": 2,
    "finalReport": "Lorem ipsum dolor sit amet",
    "id": 1,
    "nitrogenLevelN": 20,
    "nitrogenN": 30,
    "nitrogenousFertilizer": 25,
    "npkFertilizer": 100,
    "phosphorusFertilizer": 80,
    "phosphorusLevelP": 60,
    "phosphorusP": 70,
    "photassiumK": 90,
    "photassiumLevelK": 80,
    "potassiumFertilizer": 70,
    "potentialHydrogenLevelPh": 6,
    "potentialHydrogenPh": 6.5,
    "sulphurLevelS": 50,
    "sulphurS": 40,
    "testReportAvailable": true,
    "zincFertilizer": 20,
    "zincLevelZn": 10,
    "zincZN": 15
  }),
];

// purchase
List<StoreModel> purchaseStoreList = [
  StoreModel.fromJson(
    {
      'uuid': 'store123',
      'name': 'ABC Store',
      'rating': 4.5,
      'reviews': [
        {
          'avatar': 'sample_avatar.jpg',
          'username': 'johndoe',
          'storeId': 'store123',
          'productId': 'product123',
          'rating': 5,
          'isLiked': true,
          'review': 'Great store with excellent products!',
        },
      ],
      'image': ImageRoutes.purchaseRatedStore,
      'kmAway': 2.5,
      'address': 'Village Market Road',
      'contact': '555-1234',
      'activeHours': {
        'min': 9,
        'max': 5,
      },
      'categories': [
        {
          'img': ImageRoutes.purchaseCategoryImage,
          'name': 'Fertilizer',
          'uuid': 'category1',
        },
        {
          'img': ImageRoutes.purchaseCategoryImage,
          'name': 'Farm Tools',
          'uuid': 'category2',
        },
      ],
      'products': [
        {
          'uuid': 'product123',
          'name': 'Urea1',
          'rating': '4.5',
          'reviews': [
            {
              'avatar': 'sample_avatar.jpg',
              'username': 'johndoe',
              'storeId': 'store123',
              'productId': 'product123',
              'rating': 5,
              'isLiked': true,
              'review': 'Great store with excellent products!',
            }
          ],
          'image': ImageRoutes.product1,
          'categoryId': 'category2',
          'offersId': {
            'uuid': 'offer123',
            'name': 'Summer Sale',
            'percentageOff': 20,
            'amountOff': null,
          },
          'amount': 49.99,
          'rentalUnit': null,
          'quantity': 10,
          'variants': [
            {
              'productID': 'product123',
              'categoryID': 'category2',
              'variantName': '1 kg',
              'price': 49.99,
              'discount': null,
            },
            {
              'productID': 'product123',
              'categoryID': 'category2',
              'variantName': '1.5 kg',
              'price': 49.99,
              'discount': null,
            },
            {
              'productID': 'product123',
              'categoryID': 'category2',
              'variantName': '2 kg',
              'price': 49.99,
              'discount': null,
            },
          ],
        },
        {
          'uuid': 'product123',
          'name': 'Urea',
          'rating': '4.5',
          'reviews': [
            {
              'avatar': 'sample_avatar.jpg',
              'username': 'johndoe',
              'storeId': 'store123',
              'productId': 'product123',
              'rating': 5,
              'isLiked': true,
              'review': 'Great store with excellent products!',
            }
          ],
          'image': ImageRoutes.product1,
          'categoryId': 'category1',
          'offersId': {
            'uuid': 'offer123',
            'name': 'Summer Sale',
            'percentageOff': 20,
            'amountOff': null,
          },
          'amount': 49.99,
          'rentalUnit': null,
          'quantity': 10,
          'variants': [
            {
              'productID': 'product123',
              'categoryID': 'category1',
              'variantName': '1 Kg',
              'price': 49.99,
              'discount': null,
            },
          ],
        }
      ],
      'offers': [
        {
          'uuid': 'offer123',
          'name': 'Summer Sale',
          'percentageOff': 20,
          'amountOff': null,
        }
      ],
    },
  ),
];

List<PurchaseOrderModel> purchaseOrderList = [
  PurchaseOrderModel.fromJson({
    'products': [
      {
        'uuid': 'product123',
        'name': 'Mahindra tractor',
        'rating': '4.5',
        'reviews': [
          {
            'avatar': 'sample_avatar.jpg',
            'username': 'johndoe',
            'storeId': 'store123',
            'productId': 'product123',
            'rating': 5,
            'isLiked': true,
            'review': 'Great store with excellent products!',
          }
        ],
        'image': ImageRoutes.purchaseProduct,
        'categoryId': 'category123',
        'offersId': {
          'uuid': 'offer123',
          'name': 'Summer Sale',
          'percentageOff': 20,
          'amountOff': null,
        },
        'amount': 49.99,
        'rentalUnit': null,
        'quantity': 10,
        'variants': [
          {
            'productID': 'product123',
            'categoryID': 'category123',
            'variantName': 'Size',
            'price': 49.99,
            'discount': null,
          },
        ],
      },
    ],
    "price": 34.95,
    "status": "cancellation request approved",
    "delivery": true,
    "ModeofPayment": "Gpay",
  }),
];
//rental

List<CategoryModel> rentalCategoryList = [
  CategoryModel.fromJson(
      {"img": ImageRoutes.rentalCategoryImage, "name": "Vehicle", "uuid": "1"}),
  CategoryModel.fromJson({
    "img": ImageRoutes.rentalCategoryImage,
    "name": "Attachments",
    "uuid": "2"
  }),
  CategoryModel.fromJson({
    "img": ImageRoutes.rentalCategoryImage,
    "name": "Small Tools",
    "uuid": "3"
  }),
];

List<OfferModel> rentalOfferList = [
  OfferModel.fromJson({
    "uuid": "1",
    "name": "VEHICLE",
    "percentageOff": 20,
    "amountOff": 50.0,
  }),
  OfferModel.fromJson({
    "uuid": "2",
    "name": "VEHICLE",
    "percentageOff": 20,
    "amountOff": 50.0,
  }),
  OfferModel.fromJson({
    "uuid": "3",
    "name": "VEHICLE",
    "percentageOff": 20,
    "amountOff": 50.0,
  }),
];

List<VariantModel> rentalVariantList = [
  VariantModel.fromJson({
    "productID": "1",
    "categoryID": "1",
    "variantName": "NO",
    "price": 9.99,
    "discount": 20
  }),
  VariantModel.fromJson({
    "productID": "2",
    "categoryID": "1",
    "variantName": "NO",
    "price": 9.99,
    "discount": 20
  }),
  VariantModel.fromJson({
    "productID": "3",
    "categoryID": "1",
    "variantName": "NO",
    "price": 9.99,
    "discount": 20
  }),
];
//----------------------
//MarktetPlace Remaining
List<ReviewModel> rentalReviewList = [
  ReviewModel.fromJson(
    {
      "avatar": "avatar_url",
      "username": "John Doe",
      "storeId": "1",
      "productId": "1",
      "rating": 5,
      "isLiked": true,
      "review": "Great product!"
    },
  ),
  ReviewModel.fromJson(
    {
      "avatar": "avatar_url",
      "username": "John Doe",
      "storeId": "1",
      "productId": "1",
      "rating": 5,
      "isLiked": true,
      "review": "Great product!"
    },
  ),
];

List<StoreModel> rentalStoreList = [
  StoreModel.fromJson(
    {
      'uuid': 'store123',
      'name': 'ABC Store',
      'rating': 4.5,
      'reviews': [
        {
          'avatar': 'sample_avatar.jpg',
          'username': 'johndoe',
          'storeId': 'store123',
          'productId': 'product123',
          'rating': 5,
          'isLiked': true,
          'review': 'Great store with excellent products!',
        },
      ],
      'image': ImageRoutes.rentalRatedStore,
      'kmAway': 2.5,
      'address': 'Village Market Road',
      'contact': '555-1234',
      'activeHours': {
        'min': 9,
        'max': 5,
      },
      'categories': [
        {
          'img': ImageRoutes.rentalCategoryImage,
          'name': 'Vehicles',
          'uuid': 'category1',
        },
        {
          'img': ImageRoutes.rentalCategoryImage,
          'name': 'Attachments',
          'uuid': 'category2',
        },
      ],
      'products': [
        {
          'uuid': 'product123',
          'name': 'Mahindra Tractor',
          'rating': '4.5',
          'reviews': [
            {
              'avatar': 'sample_avatar.jpg',
              'username': 'johndoe',
              'storeId': 'store123',
              'productId': 'product123',
              'rating': 5,
              'isLiked': true,
              'review': 'Great store with excellent products!',
            }
          ],
          'image': ImageRoutes.rentalCategoryImage,
          'categoryId': 'category2',
          'offersId': {
            'uuid': 'offer123',
            'name': 'Summer Sale',
            'percentageOff': 20,
            'amountOff': null,
          },
          'amount': 49.99,
          'rentalUnit': "Hrs",
          'quantity': 10,
          'variants': [
            {
              'productID': 'product123',
              'categoryID': 'category2',
              'variantName': 'Size',
              'price': 49.99,
              'discount': null,
            },
          ],
        },
        {
          'uuid': 'product123',
          'name': 'Mahindra Tractor 1',
          'rating': '4.5',
          'reviews': [
            {
              'avatar': 'sample_avatar.jpg',
              'username': 'johndoe',
              'storeId': 'store123',
              'productId': 'product123',
              'rating': 5,
              'isLiked': true,
              'review': 'Great store with excellent products!',
            }
          ],
          'image': ImageRoutes.rentalCategoryImage,
          'categoryId': 'category1',
          'offersId': {
            'uuid': 'offer123',
            'name': 'Summer Sale',
            'percentageOff': 20,
            'amountOff': null,
          },
          'amount': 49.99,
          'rentalUnit': "Hrs",
          'quantity': 10,
          'variants': [
            {
              'productID': 'product123',
              'categoryID': 'category1',
              'variantName': 'Size',
              'price': 49.99,
              'discount': null,
            },
          ],
        }
      ],
      'offers': [
        {
          'uuid': 'offer123',
          'name': 'Summer Sale',
          'percentageOff': 20,
          'amountOff': null,
        }
      ],
    },
  ),
];

List<RentalOrderModel> rentalOrderList = [
  RentalOrderModel.fromJson({
    'products': [
      {
        'uuid': 'product123',
        'name': 'Mahindra YUVO',
        'rating': '4.5',
        'reviews': [
          {
            'avatar': 'sample_avatar.jpg',
            'username': 'johndoe',
            'storeId': 'store123',
            'productId': 'product123',
            'rating': 5,
            'isLiked': true,
            'review': 'Great store with excellent products!',
          }
        ],
        'image': ImageRoutes.rentalProduct,
        'categoryId': 'category123',
        'offersId': {
          'uuid': 'offer123',
          'name': 'Summer Sale',
          'percentageOff': 20,
          'amountOff': null,
        },
        'amount': 49.99,
        'rentalUnit': null,
        'quantity': 10,
        'variants': [
          {
            'productID': 'product123',
            'categoryID': 'category123',
            'variantName': 'Size',
            'price': 49.99,
            'discount': null,
          },
        ],
      }
    ],
    "price": 22.97,
    "status": "pending confirmation",
    "rentalDuration": 3,
    "rentalDurationUnit": "days",
    "pickupDateTime": "2023-06-13T10:00:00Z",
    "dropoffDateTime": "2023-06-16T18:00:00Z",
    "delivery": false,
    "ModeofPayment": "Gpay",
  }),
];

List<CategoryModel> purchaseCategoryList = [
  CategoryModel.fromJson({
    "img": ImageRoutes.purchaseCategoryImage,
    "name": "Fertilizer",
    "uuid": "1"
  }),
  CategoryModel.fromJson(
      {"img": ImageRoutes.purchaseCategoryImage, "name": "Seeds", "uuid": "2"}),
  CategoryModel.fromJson(
      {"img": ImageRoutes.purchaseCategoryImage, "name": "Tools", "uuid": "3"}),
];

List<OfferModel> purchaseOfferList = [
  OfferModel.fromJson({
    "uuid": "1",
    "name": "FERTILIZER",
    "percentageOff": 20,
    "amountOff": 50.0,
  }),
  OfferModel.fromJson({
    "uuid": "2",
    "name": "FERTILIZER",
    "percentageOff": 20,
    "amountOff": 50.0,
  }),
  OfferModel.fromJson({
    "uuid": "3",
    "name": "FERTILIZER",
    "percentageOff": 20,
    "amountOff": 50.0,
  }),
];

List<LabModel> labModel = [
  LabModel.fromJson({
    "uuid": "123456",
    "name": "Lab Name",
    "rating": 4.5,
    "reviewModel": [
      {
        "avatar": "https://example.com/avatar.png",
        "username": "JohnDoe",
        "labId": "abc123",
        "soilTestId": "xyz789",
        "rating": 4,
        "isLiked": true,
        "review": "This soil testing service is excellent!",
        "numberOfUser": 10
      }
    ],
    "image": ImageRoutes.labImage,
    "kmAway": 2.5,
    "Address": "123 Main St",
    "contact": "123-456-7890",
    "activeHours": 8,
    "aboutUs": "We provide accurate soil testing services.",
    "soilSampleTestModel": [
      {
        "testcontent": "Content of the test",
        "testName": "Test Name",
        "testType": "Type A",
        "reportingDays": 2,
        "reviewModel": [
          {
            "avatar": "https://example.com/avatar.png",
            "username": "JohnDoe",
            "labId": "abc123",
            "soilTestId": "xyz789",
            "rating": 4,
            "isLiked": true,
            "review": "This soil testing service is excellent!",
            "numberOfUser": 10
          }
        ],
        "image": "https://example.com/test.png",
        "offerModel":
        {
          "uuid": "offer123",
          "name": "Special Offer",
          "percentageOff": 20,
          "amountOff": null
        },
        "amount": 50.0,
        "sampleUnit": "kg",
        "uuid": "123456"
      }
    ],
    "OfferModel": [
      {
        "uuid": "offer123",
        "name": "Special Offer",
        "percentageOff": 20,
        "amountOff": null
      }
    ],
    "reportingDays": 3

}),
  LabModel.fromJson({
    "uuid": "123456",
    "name": "Lab Name",
    "rating": 4.5,
    "reviewModel": [
      {
        "avatar": "https://example.com/avatar.png",
        "username": "JohnDoe",
        "labId": "abc123",
        "soilTestId": "xyz789",
        "rating": 4,
        "isLiked": true,
        "review": "This soil testing service is excellent!",
        "numberOfUser": 10
      }
    ],
    "image": ImageRoutes.labImage,
    "kmAway": 2.5,
    "Address": "123 Main St",
    "contact": "123-456-7890",
    "activeHours": 8,
    "aboutUs": "We provide accurate soil testing services.",
    "soilSampleTestModel": [
      {
        "testcontent": "Content of the test",
        "testName": "Test Name",
        "testType": "Type A",
        "reportingDays": 2,
        "reviewModel": [
          {
            "avatar": "https://example.com/avatar.png",
            "username": "JohnDoe",
            "labId": "abc123",
            "soilTestId": "xyz789",
            "rating": 4,
            "isLiked": true,
            "review": "This soil testing service is excellent!",
            "numberOfUser": 10
          }
        ],
        "image": "https://example.com/test.png",
        "offerModel":
        {
          "uuid": "offer123",
          "name": "Special Offer",
          "percentageOff": 20,
          "amountOff": null
        },
        "amount": 50.0,
        "sampleUnit": "kg",
        "uuid": "123456"
      }
    ],
    "OfferModel": [
      {
        "uuid": "offer123",
        "name": "Special Offer",
        "percentageOff": 20,
        "amountOff": null
      }
    ],
    "reportingDays": 3

  }),
  ];

SoilTestBookingModel booking = SoilTestBookingModel.fromJson(
    {
      "soilSampleTestModel": [
        {
          "testcontent": "Content of the test",
          "testName": "Test Name",
          "testType": "Type A",
          "reportingDays": 2,
          "reviewModel": [
            {
              "avatar": "https://example.com/avatar.png",
              "username": "JohnDoe",
              "labId": "abc123",
              "soilTestId": "xyz789",
              "rating": 4,
              "isLiked": true,
              "review": "This soil testing service is excellent!",
              "numberOfUser": 10
            }
          ],
          "image": ImageRoutes.labImage,
          "offerModel":
            {
              "uuid": "offer123",
              "name": "Special Offer",
              "percentageOff": 20,
              "amountOff": null
            },

          "amount": 50.0,
          "sampleUnit": "kg",
          "uuid": "123456"
        }
      ],
      "price": 100.0,
      "status": "In Progress",
      "isSelfSoilCollection": false,
      "farmLocations": [
        "Farm 1",
        "Farm 2"
      ],
      "SoilCollectionDateTime": "2023-06-26T10:00:00.000Z",
      "getSoilReportDateTime": "2023-07-01T09:00:00.000Z",
      "numberOfSamples": 5
    }
);


//Constants
List<String> selectPlantPartDropDownList = [
  "Select Plant Part",
  "Root",
  "Flower",
  "Stem",
  "Leaves",
  "Fruit"
];
List<String> selectCropDropDownList = [
  AppStrings.selectCrop,
  "Apple",
  "Avocado",
  "Banana",
  "Bean",
  "Black Nightshade",
  "Black peper",
  "Brinjal",
  "Cabbage",
  "Capsicum",
  "Carrot",
  "Cashew Nut",
  "Cassava",
  "Chickpea",
  "Cocoa",
  "Cocoyam",
  "Coffee",
  "Common beans",
  "Coriander",
  "Cotton",
  "Cowpea",
  "Cucumber",
  "Ginger",
  "Green Chilli",
  "Grean Pea",
  "Greengram",
  "Groundnut",
  "Kale",
  "Leek",
  "Lemon",
  "Maize",
  "Mango",
  "Millet",
  "Okra",
  "Onion",
  "Orange",
  "Palm",
  "Papaya",
  "Passion fruit",
  "Pear",
  "Peper",
  "Pigeon Pea",
  "Pineapple",
  "Plantain",
  "Potato",
  "Rice",
  "Rice-Lowland",
  "Rose",
  "Sesame",
  "Sorghum",
  "Soyabean",
  "Spinach",
  "Squash",
  "Sugar beat",
  "sugarcane",
  "Sunflower",
  "Sweet Patato",
  "Tea",
  "Tomato",
  "Turmeric",
  "Watermelon",
  "Wheat",
  "White Pepper",
  "Yam"
];
List<String> growthStageDropDownList = [
  AppStrings.growthStage,
  "Flowering",
  "Fruiting",
  "Harvesting",
  "Panicle initiation stage",
  "Vegetative",
  "Crown root initiation",
  "Stem elongation",
  "Maturity",
  "Tuber Bulking",
  "tuber Initiation",
  "Tillering",
  "Sowing",
  "Transplanting",
  "Dough",
  "Booting stage",
  "Heading stage",
  "Grain filling state",
  "Milking stage",
  "60 days after sowing",
  "Any Stage",
  "Germination",
  "30 days after sowing",
  "90 days after sowing",
  "Pre-sowing",
  "Tasseling",
  "Silking",
  "50 days after sowing",
  "Squaring",
  "Boll development",
  "1-3 years",
  "4-5 years",
  "6-7 years",
  "8-9 years",
  "10th year onwards",
  "knee-height"
];

// Soil Test dummy objects
// List<SoilTestBookingModel> soilTestBookingModelList = [
//   SoilTestBookingModel.fromJson({
//     "soilSampleTestModel": [
//       {
//         "testcontent": "Test Content 1",
//         "testName": "Test Name 1",
//         "testType": "Test Type 1",
//         "reportingDays": 3,
//         "reviewModel": [
//           {
//             "avatar": "avatar1.jpg",
//             "username": "User 1",
//             "labId": "Lab ID 1",
//             "soilTestId": "Soil Test ID 1",
//             "rating": 5,
//             "isLiked": true,
//             "review": "Great test!",
//             "numberOfUser": 10
//           },
//           {
//             "avatar": "avatar2.jpg",
//             "username": "User 2",
//             "labId": "Lab ID 2",
//             "soilTestId": "Soil Test ID 1",
//             "rating": 4,
//             "isLiked": false,
//             "review": "Good test!",
//             "numberOfUser": 5
//           }
//         ],
//         "image": "image1.jpg",
//         "offerModel": {
//           "uuid": "Offer UUID 1",
//           "name": "Offer Name 1",
//           "percentageOff": 20,
//           "amountOff": 12.3,
//         },
//         "amount": 50.0,
//         "sampleUnit": "Sample Unit 1",
//         "uuid": "UUID 1"
//       },
//       {
//         "testcontent": "Test Content 2",
//         "testName": "Test Name 2",
//         "testType": "Test Type 2",
//         "reportingDays": 5,
//         "reviewModel": [
//           {
//             "avatar": "avatar1.jpg",
//             "username": "User 1",
//             "labId": "Lab ID 1",
//             "soilTestId": "Soil Test ID 1",
//             "rating": 5,
//             "isLiked": true,
//             "review": "Great test!",
//             "numberOfUser": 10
//           },
//           {
//             "avatar": "avatar2.jpg",
//             "username": "User 2",
//             "labId": "Lab ID 2",
//             "soilTestId": "Soil Test ID 1",
//             "rating": 4,
//             "isLiked": false,
//             "review": "Good test!",
//             "numberOfUser": 5
//           }
//         ],
//         "image": "image2.jpg",
//         "offerModel": {
//           "uuid": "Offer UUID 1",
//           "name": "Offer Name 1",
//           "percentageOff": 20,
//           "amountOff": 12.3,
//         },
//         "amount": 100.0,
//         "sampleUnit": "sample unit",
//         "uuid": "UUID 2"
//       }
//     ],
//     "price": 150.0,
//     "status": "Pending",
//     "isSelfSoilCollection": true,
//     "farmLocations": ["Farm Location 1", "Farm Location 2", "Farm Location 3"],
//     "soilCollectionDateTime": "2023-06-27T09:00:00Z",
//     "getSoilReportDateTime": "2023-07-05T15:30:00Z",
//     "numberOfSamples": 2
//   }),
// ];

List<SoilTestBookingModel> soilTestBookingModelList = [
  SoilTestBookingModel.fromJson({
    "soilSampleTestModel": [
      {
        "testcontent": "Test Content 1",
        "testName": "Test Name 1",
        "testType": "Test Type 1",
        "reportingDays": 3,
        "reviewModel": [
          {
            "avatar": "avatar1.jpg",
            "username": "User 1",
            "labId": "Lab ID 1",
            "soilTestId": "Soil Test ID 1",
            "rating": 5,
            "isLiked": true,
            "review": "Great test!",
            "numberOfUser": 10
          },
          {
            "avatar": "avatar2.jpg",
            "username": "User 2",
            "labId": "Lab ID 2",
            "soilTestId": "Soil Test ID 1",
            "rating": 4,
            "isLiked": false,
            "review": "Good test!",
            "numberOfUser": 5
          }
        ],
        "image": "image1.jpg",
        "offerModel": {
          "uuid": "Offer UUID 1",
          "name": "Offer Name 1",
          "percentageOff": 20,
          "amountOff": 12.3
        },
        "amount": 50.0,
        "sampleUnit": "Sample Unit 1",
        "uuid": "UUID 1"
      },
      {
        "testcontent": "Test Content 2",
        "testName": "Test Name 2",
        "testType": "Test Type 2",
        "reportingDays": 5,
        "reviewModel": [
          {
            "avatar": "avatar1.jpg",
            "username": "User 1",
            "labId": "Lab ID 1",
            "soilTestId": "Soil Test ID 1",
            "rating": 5,
            "isLiked": true,
            "review": "Great test!",
            "numberOfUser": 10
          },
          {
            "avatar": "avatar2.jpg",
            "username": "User 2",
            "labId": "Lab ID 2",
            "soilTestId": "Soil Test ID 1",
            "rating": 4,
            "isLiked": false,
            "review": "Good test!",
            "numberOfUser": 5
          }
        ],
        "image": "image2.jpg",
        "offerModel": {
          "uuid": "Offer UUID 1",
          "name": "Offer Name 1",
          "percentageOff": 20,
          "amountOff": 12.3
        },
        "amount": 100.0,
        "sampleUnit": "sample unit",
        "uuid": "UUID 2"
      }
    ],
    "price": 150.0,
    "status": "Pending",
    "isSelfSoilCollection": true,
    "farmLocations": ["Farm Location 1", "Farm Location 2", "Farm Location 3"],
    "soilCollectionDateTime": DateTime.now(),
    "getSoilReportDateTime": DateTime.now(),
    "numberOfSamples": 2
  }),
];

List<LabModel> labModelList = [
  LabModel.fromJson({
    "uuid": "abc123",
    "name": "Farm Lab",
    "rating": 4.5,
    "reviewModel": [
      {
        "avatar": "avatar_url",
        "username": "JohnDoe",
        "labId": "lab123",
        "soilTestId": "test123",
        "rating": 4,
        "isLiked": true,
        "review": "Great service!",
        "numberOfUser": 10
      },
      {
        "avatar": "avatar_url",
        "username": "JaneSmith",
        "labId": "lab123",
        "soilTestId": "test123",
        "rating": 5,
        "isLiked": true,
        "review": "Highly recommended!",
        "numberOfUser": 15
      }
    ],
    "image": "lab_image_url",
    "kmAway": 2.5,
    "address": "123 Main St, City",
    "contact": "123-456-7890",
    "activeHours": {"min": 8, "max": 18},
    "aboutUs": "Farm Lab is a leading agricultural testing laboratory.",
    "soilSampleTestModel": [
      {
        "testcontent": "pH, Nitrogen, Phosphorus",
        "testName": "Basic Soil Test",
        "testType": "Standard",
        "reportingDays": 3,
        "reviewModel": [
          {
            "avatar": "avatar_url",
            "username": "JohnDoe",
            "labId": "lab123",
            "soilTestId": "test123",
            "rating": 4,
            "isLiked": true,
            "review": "Great service!",
            "numberOfUser": 10
          },
          {
            "avatar": "avatar_url",
            "username": "JaneSmith",
            "labId": "lab123",
            "soilTestId": "test123",
            "rating": 5,
            "isLiked": true,
            "review": "Highly recommended!",
            "numberOfUser": 15
          }
        ],
        "image": "test_image_url",
        "offerModel": {
          "uuid": "offer123",
          "name": "Special Offer",
          "percentageOff": 0,
          "amountOff": 10.0
        },
        "amount": 50.0,
        "sampleUnit": "unit",
        "uuid": "test123"
      },
      {
        "testcontent": "pH, Nitrogen, Phosphorus, Potassium",
        "testName": "Complete Soil Test",
        "testType": "Advanced",
        "reportingDays": 5,
        "reviewModel": [
          {
            "avatar": "avatar_url",
            "username": "JohnDoe",
            "labId": "lab123",
            "soilTestId": "test123",
            "rating": 4,
            "isLiked": true,
            "review": "Great service!",
            "numberOfUser": 10
          },
          {
            "avatar": "avatar_url",
            "username": "JaneSmith",
            "labId": "lab123",
            "soilTestId": "test123",
            "rating": 5,
            "isLiked": true,
            "review": "Highly recommended!",
            "numberOfUser": 15
          }
        ],
        "image": "test_image_url",
        "offerModel": {
          "uuid": "offer123",
          "name": "Special Offer",
          "percentageOff": 0,
          "amountOff": 10.0
        },
        "amount": 75.0,
        "sampleUnit": "unit",
        "uuid": "test456"
      }
    ],
    "offerModel": [
      {
        "uuid": "offer123",
        "name": "Special Offer",
        "percentageOff": 20,
        "amountOff": 0.0
      },
      {
        "uuid": "offer456",
        "name": "New Customer Discount",
        "percentageOff": 15,
        "amountOff": 0.0
      }
    ],
    "reportingDays": 2
  }),
];

// List<LabModel> labModelList = [
//   LabModel.fromJson({
//     "uuid": "abc123",
//     "name": "Farm Lab",
//     "rating": 4.5,
//     "reviewModel": [
//       {
//         "avatar": "avatar_url",
//         "username": "JohnDoe",
//         "labId": "lab123",
//         "soilTestId": "test123",
//         "rating": 4,
//         "isLiked": true,
//         "review": "Great service!",
//         "numberOfUser": 10
//       },
//       {
//         "avatar": "avatar_url",
//         "username": "JaneSmith",
//         "labId": "lab123",
//         "soilTestId": "test123",
//         "rating": 5,
//         "isLiked": true,
//         "review": "Highly recommended!",
//         "numberOfUser": 15
//       }
//     ],
//     "image": "lab_image_url",
//     "kmAway": 2.5,
//     "address": "123 Main St, City",
//     "contact": "123-456-7890",
//     "activeHours": {"min": 8, "max": 18},
//     "aboutUs": "Farm Lab is a leading agricultural testing laboratory.",
//     "soilSampleTestModel": [
//       {
//         "testcontent": "pH, Nitrogen, Phosphorus",
//         "testName": "Basic Soil Test",
//         "testType": "Standard",
//         "reportingDays": 3,
//         "reviewModel": [],
//         "image": "test_image_url",
//         "offerModel": null,
//         "amount": 50.0,
//         "sampleUnit": null,
//         "uuid": null
//       },
//       {
//         "testcontent": "pH, Nitrogen, Phosphorus, Potassium",
//         "testName": "Complete Soil Test",
//         "testType": "Advanced",
//         "reportingDays": 5,
//         "reviewModel": [],
//         "image": "test_image_url",
//         "offerModel": {
//           "uuid": "offer123",
//           "name": "Special Offer",
//           "percentageOff": null,
//           "amountOff": 10.0
//         },
//         "amount": 75.0,
//         "sampleUnit": null,
//         "uuid": null
//       }
//     ],
//     "offerModel": [
//       {
//         "uuid": "offer123",
//         "name": "Special Offer",
//         "percentageOff": 20,
//         "amountOff": null
//       },
//       {
//         "uuid": "offer456",
//         "name": "New Customer Discount",
//         "percentageOff": 15,
//         "amountOff": null
//       }
//     ],
//     "reportingDays": 2
//   }),
// ];
