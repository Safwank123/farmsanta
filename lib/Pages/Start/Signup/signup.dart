import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:farmsanta_new/Constants/api_constants.dart';
import 'package:farmsanta_new/Constants/enums.dart';
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Controller/master_controller.dart';
import 'package:farmsanta_new/Core/extension.dart';
import 'package:farmsanta_new/Core/shared_pref.dart';
import 'package:farmsanta_new/Functions/app_functions.dart';
import 'package:farmsanta_new/Functions/common.dart' as StyleHelper;
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Models/Common/crop_model.dart';
import 'package:farmsanta_new/Models/Farmer/Farmer.dart';
import 'package:farmsanta_new/Models/Farmer/Land.dart';
import 'package:farmsanta_new/Pages/Home/home.dart';
import 'package:farmsanta_new/Pages/Start/Signup/add_crop.dart';
import 'package:farmsanta_new/Pages/Start/Signup/farm_base.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Market/market.dart' as AppThemeColors;
import 'package:farmsanta_new/Services/store_helper.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_edit_text_white_back.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/app_bar.dart';
import 'package:farmsanta_new/Widgets/classes/card_helper.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:farmsanta_new/api/master-service.dart';
import 'package:farmsanta_new/mututations/common.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = '/signup-screen';
  
  const SignupScreen({Key? key}) : super(key: key);
  
  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  // Data lists
  final List<String> territories = ["India"];
  final List<String> regions = ["Gujarat"];
  final List<String> counties = ["Ahmedabad"];
  final List<String> subCounties = ["Central", "North", "South", "East", "West"];
  final List<String> villages = ["Village A", "Village B", "Village C"];
  final List<String> uoms = ["acres", "hectares", "sq meters"];

  // Form controllers
  final TextEditingController farmSizeController = TextEditingController();
  final List<TextEditingController> controllers = List.generate(8, (index) => TextEditingController());
  final List<String> names = [
    AppStrings.mobileNumber,
    AppStrings.secondaryNumber,
    AppStrings.email,
    AppStrings.firstName,
    AppStrings.middleName,
    AppStrings.lastName,
    AppStrings.quarterAddress,
  ];

  // State variables
  String selectedUom = "acres";
  String? selectedTerritory;
  String? selectedRegion;
  String? selectedCounty;
  String? selectedSubCounty;
  String? selectedVillage;
  File? imageFile;
  late Farmer farmer;
  bool edit = false;
  List<CropModelShort> cropsSelected = [];
  List<LandModel> lands = [];
  String countryCode = "+91";

  @override
  void initState() {
    super.initState();
    initializeFarmer();
    getData();
  }

  void initializeFarmer() {
    if (edit && StoreHelper.store.farmerMainModel != null) {
      farmer = StoreHelper.store.farmerMainModel!;
      controllers[2].text = farmer.email ?? "";
      controllers[3].text = farmer.firstName ?? "";
      controllers[4].text = farmer.midName ?? "";
      controllers[5].text = farmer.lastName ?? "";
      controllers[6].text = farmer.address ?? "";
    } else {
      final store = StoreHelper.store;
      farmer = Farmer(
        address: controllers[6].text,
        country: selectedTerritory ?? "India",
        countryCode: countryCode,
        createdBy: "",
        createdTimestamp: DateTime.now(),
        crop1: cropsSelected.isNotEmpty ? cropsSelected[0].uuid : null,
        crop2: cropsSelected.length > 1 ? cropsSelected[1].uuid : null,
        crop3: cropsSelected.length > 2 ? cropsSelected[2].uuid : null,
        dataSource: "",
        dateOfBirth: null,
        district: selectedCounty ?? "Ahmedabad",
        documents: [],
        education: store.educationLevel.isNotEmpty ? store.educationLevel[0] : "",
        email: controllers[2].text,
        farmerGroup: "",
        farmertag: "",
        firstName: controllers[3].text,
        gender: "",
        hasSmartphone: false,
        id: 0,
        lands: lands,
        languageId: 1,
        lastName: controllers[5].text,
        midName: controllers[4].text,
        mobile: controllers[0].text,
        pin: "",
        profileImage: "",
        region: [selectedRegion ?? "Gujarat"],
        role: store.role,
        sequence: 0,
        status: "Active",
        subDistrict: selectedSubCounty,
        tenantId: "",
        territory: [selectedTerritory ?? "India"],
        updatedBy: "",
        updatedTimestamp: DateTime.now(),
        userId: "",
        userName: "",
        uuid: "",
        village: selectedVillage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final primary = AppThemeColors.getColor(AppThemeColorsEnum.primary);
    final colorLint = AppThemeColors.getColor(AppThemeColorsEnum.textFieldLintBackground);

    return Scaffold(
      backgroundColor: AppThemeColors.getColor(AppThemeColorsEnum.background),
      appBar: AppBarDesigns.getAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileImageSection(primary),
              _buildContactDetailsSection(),
              _buildGenderSection(primary),
              _buildEducationSection(),
              _buildAddressSection(primary, colorLint),
              _buildDateOfBirthSection(colorLint),
              _buildFarmSizeSection(colorLint),
              _buildCropsSection(primary),
              _buildFarmSection(),
              _buildDoneButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImageSection(Color primary) {
    return Column(
      children: [
        10.heightBox,
        Stack(
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(shape: BoxShape.circle, color: primary),
            ),
            _buildProfileImage(),
            Positioned.fill(
              child: Icon(Icons.camera_alt, color: Colors.white).pOnly(top: 48, left: 50)
            ),
          ],
        ).onInkTap(() => WidgetHelper.showAttachmentDialog(context, getImage)).centered(),
        CustomText(textKey: AppStrings.addImage).centered(),
      ],
    );
  }

  Widget _buildProfileImage() {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.grey[200],
      child: _buildProfileImageContent(),
    ).centered();
  }

  Widget _buildProfileImageContent() {
    if (imageFile != null) {
      return ClipOval(
        child: Image.file(
          imageFile!,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildDefaultProfileIcon(),
        ),
      );
    }
    
    if (farmer.profileImage?.isNotEmpty ?? false) {
      return ClipOval(
        child: CachedNetworkImage(
          imageUrl: farmer.profileImage!,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => _buildDefaultProfileIcon(),
        ),
      );
    }
    
    return _buildDefaultProfileIcon();
  }

  Widget _buildDefaultProfileIcon() {
    return Icon(
      Icons.person,
      size: 40,
      color: Colors.white,
    );
  }

  Widget _buildContactDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StatefulBuilder(
          builder: (context, setState) => Column(
            children: [
              for (int i = 0; i < 2; i++)
                ...WidgetHelper.getNameAndInputField(
                  names[i], 
                  controllers[i], 
                  context,
                  isMob: true,
                  countryCode: countryCode, 
                  onChange: (value) => setState(() => countryCode = value),
                ),
            ],
          ),
        ),
        ...WidgetHelper.getNameAndInputField(names[2], controllers[2], context, isEmail: true),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 3; i < 5; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: WidgetHelper.getNameAndInputField(
                  names[i], controllers[i], context, width: 40
                ),
              )
          ],
        ),
        ...WidgetHelper.getNameAndInputField(names[5], controllers[5], context, width: 40),
      ],
    );
  }

  Widget _buildGenderSection(Color primary) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        15.heightBox,
        CustomText(textKey: AppStrings.gender, color: primary, bold: true),
        VxBuilder(
          builder: (context, store, status) {
            final genders = StoreHelper.store.genders;
            return StatefulBuilder(
              builder: (context, setState) => Column(
                children: List.generate((genders.length / 2).ceil(), (index) {
                  final start = 2 * index;
                  final gen = genders[start];
                  final gen1 = start + 1 <= genders.length - 1 ? genders[start + 1] : null;
                  
                  return Row(
                    children: [
                      WidgetHelper.getRadio(gen, (value) => setState(() => farmer.gender = gen), 
                        farmer.gender == gen).w40(context),
                      if (gen1 != null)
                        WidgetHelper.getRadio(gen1, (value) => setState(() => farmer.gender = gen1), 
                          farmer.gender == gen1).w40(context),
                    ],
                  ).wFull(context);
                }),
              ),
            );
          },
          mutations: const {UpdateGenderListMututation},
        ),
      ],
    );
  }

  Widget _buildEducationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        15.heightBox,
        CustomText(textKey: AppStrings.education, bold: true),
        WidgetHelper.getVxBuilderWithDropDown(
          {UpdateEducationListMututation}, 
          (value) => farmer.education = value, 
          SignUpEnum.education, 
          farmer.education ?? ""
        ),
      ],
    );
  }

  Widget _buildAddressSection(Color primary, Color colorLint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        15.heightBox,
        CustomText(textKey: AppStrings.addAddress, color: primary, bold: true),
        CustomInputField(
          hint: AppStrings.quarterAddress,
          textEditingController: controllers[6],
        ),
        15.heightBox,
        _buildLocationDropdowns(colorLint),
      ],
    );
  }

  Widget _buildLocationDropdowns(Color colorLint) {
    return Column(
      children: [
        _buildDropdown(
          value: selectedTerritory,
          items: territories,
          hint: "Select Country",
          onChanged: (newValue) => setState(() => selectedTerritory = newValue),
          decoration: colorLint,
        ),
        15.heightBox,
        _buildDropdown(
          value: selectedRegion,
          items: regions,
          hint: "Select Region",
          onChanged: (newValue) => setState(() => selectedRegion = newValue),
          decoration: colorLint,
        ),
        15.heightBox,
        _buildDropdown(
          value: selectedCounty,
          items: counties,
          hint: "Select District",
          onChanged: (newValue) => setState(() => selectedCounty = newValue),
          decoration: colorLint,
        ),
        15.heightBox,
        _buildDropdown(
          value: selectedSubCounty,
          items: subCounties,
          hint: "Select Region",
          onChanged: (newValue) => setState(() => selectedSubCounty = newValue),
          decoration: colorLint,
        ),
        15.heightBox,
        _buildDropdown(
          value: selectedVillage,
          items: villages,
          hint: "Select Village",
          onChanged: (newValue) => setState(() => selectedVillage = newValue),
          decoration: colorLint,
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required String hint,
    required ValueChanged<String?> onChanged,
    required Color decoration,
  }) {
    return Container(
      decoration: StyleHelper.getBoxDecorationAll(8, decoration),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: value,
          hint: Text(hint).px12(),
          items: items.map((value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value).px12(),
          )).toList(),
          onChanged: onChanged,
        ),
      ).h(60).wFull(context),
    );
  }

  Widget _buildDateOfBirthSection(Color colorLint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        15.heightBox,
        CustomText(textKey: AppStrings.dateOfBirth, bold: true),
        StatefulBuilder(
          builder: (context, setState) => Container(
            decoration: StyleHelper.getBoxDecorationAll(8, colorLint),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  textKey: farmer.dateOfBirth == null 
                    ? AppStrings.selectDate 
                    : AppFunctions.getDataFormat1(farmer.dateOfBirth!),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ).px12(),
          ).h(60).wPCT(context: context, widthPCT: 75)
           .onInkTap(() => showDatePickerDialog().then((_) => setState(() {}))),
        ),
      ],
    );
  }

  Widget _buildFarmSizeSection(Color colorLint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        15.heightBox,
        CustomText(textKey: AppStrings.farmSize, bold: true),
        Container(
          decoration: StyleHelper.getBoxDecorationAll(8, colorLint),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomInputField(
                isNumber: true,
                hint: AppStrings.farmSize,
                textEditingController: farmSizeController,
              ).w40(context),
              DropdownButtonHideUnderline(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedUom,
                    items: uoms.map((value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    )).toList(),
                    onChanged: (newValue) => setState(() => selectedUom = newValue!),
                  ),
                ),
              ).wPCT(context: context, widthPCT: 25),
            ],
          ),
        ).wPCT(context: context, widthPCT: 75).h(60),
      ],
    );
  }

  Widget _buildCropsSection(Color primary) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        15.heightBox,
        StatefulBuilder(
          builder: (context, setState) => Column(
            children: [
              getRow(AppStrings.addCrop, AppStrings.edit, () => addCrops(() => setState(() {}))),
              10.heightBox,
              cropsSelected.isEmpty 
                ? _buildAddCropButton(primary, () => setState(() {}))
                : _buildSelectedCrops(() => setState(() {}), primary),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddCropButton(Color primary, VoidCallback updateState) {
    return GestureDetector(
      onTap: () => addCrops(updateState),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          DottedBorder(
         
            child: Icon(Icons.add, size: 40, color: primary).p12(),
          ).pOnly(bottom: 27),
          Chip(
            padding: const EdgeInsets.all(2),
            backgroundColor: primary,
            label: const Text('Add', style: TextStyle(fontSize: 10, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedCrops(VoidCallback updateState, Color primary) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(
        cropsSelected.length,
        (index) => Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CropImageWidget(
                  imagePath: cropsSelected[index].imagePath,
                  size: 60,
                ),
                const SizedBox(height: 4),
                Text(
                  cropsSelected[index].cropName,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                IconButton(
                  icon: Icon(Icons.close, size: 16),
                  onPressed: () {
                    setState(() {
                      cropsSelected.removeAt(index);
                    });
                    updateState();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFarmSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        15.heightBox,
        StatefulBuilder(
          builder: (context, setState) => Column(
            children: [
              getRow(
                "${AppStrings.myFarm.translate()} (${lands.length})",
                AppStrings.addFarm,
                () => navigateToAddFarm(() => setState(() {})),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDoneButton() {
    return Column(
      children: [
        30.heightBox,
        CustomButtonElevated(
          onTap: completeSignUp,
          text: AppStrings.done,
        ).w64(context).centered(),
        30.heightBox,
      ],
    );
  }

  Widget getRow(String text1, String text2, VoidCallback onClick) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          textKey: text1,
          color: AppThemeColors.getColor(AppThemeColorsEnum.primary),
          bold: true,
        ),
        CustomText(
          textKey: text2,
          color: AppThemeColors.getColor(AppThemeColorsEnum.primary),
          bold: true,
        ).onInkTap(onClick),
      ],
    );
  }

  Future<void> getImage(bool gallery) async {
    try {
      Navigator.pop(context);
      final filePicker = ImagePicker();
      final imagePicked = await filePicker.pickImage(
        source: gallery ? ImageSource.gallery : ImageSource.camera,
        maxWidth: 200,
        maxHeight: 200,
      );
      
      if (imagePicked != null && mounted) {
        final file = File(imagePicked.path);
        if (await file.exists()) {
          setState(() => imageFile = file);
        } else {
          StyleHelper.showToast("Failed to load selected image");
        }
      }
    } catch (e) {
      debugPrint('Image picker error: $e');
      if (mounted) {
        StyleHelper.showToast("Failed to select image");
      }
    }
  }

  Future<void> navigateToAddFarm(VoidCallback updateState) async {
    try {
      final status = await Permission.location.request();
      if (status == PermissionStatus.granted) {
        StoreHelper.store.position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation,
        );
        final result = await StyleHelper.navigateToPageWithoutReplaceMentNamed(FarmScreen.routeName);
        if (result != null && result is List<LandModel> && mounted) {
          updateState();
          lands = result;
        }
      } else {
        StyleHelper.showToast("Location permission is required");
      }
    } catch (e) {
      debugPrint('Farm navigation error: $e');
      if (mounted) {
        StyleHelper.showToast("Failed to add farm location");
      }
    }
  }

  Future<void> completeSignUp() async {
    if (!_validateInputs()) return;

    try {
      _updateFarmerData();

      await SharedPref.setModelData(farmer, SharedPrefKeys.farmerDetails);
      StoreHelper.store.farmerMainModel = farmer;
      if (mounted) {
        StyleHelper.navigateToPageReplaceMentNamed(HomeScreen.routeName);
        StyleHelper.showToast("Profile saved successfully");
      }
    } catch (e) {
      debugPrint('Signup error: $e');
      if (mounted) {
        StyleHelper.showToast("Failed to save profile");
      }
    }
  }

  bool _validateInputs() {
    final mob = controllers[0].text;
    final email = controllers[2].text;
    final fname = controllers[3].text;
    final lname = controllers[5].text;

    if (mob.isEmptyOrNull || mob.length <= 7) {
      StyleHelper.showToast("Please enter valid mobile number");
      return false;
    }
    if (!isEmailValid(email)) {
      StyleHelper.showToast("Please enter valid email address");
      return false;
    }
    if (fname.isEmpty || fname.length < 3) {
      StyleHelper.showToast("Please enter at least 3 characters in first name");
      return false;
    }
    if (lname.isEmpty) {
      StyleHelper.showToast("Please enter last name");
      return false;
    }
    if (farmer.gender.isEmptyOrNull) {
      StyleHelper.showToast("Please select the gender");
      return false;
    }
    if (cropsSelected.isEmpty) {
      StyleHelper.showToast("Please select at least one crop");
      return false;
    }
    return true;
  }

  void _updateFarmerData() {
    farmer.email = controllers[2].text;
    farmer.mobile = controllers[0].text;
    farmer.firstName = controllers[3].text;
    farmer.lastName = controllers[5].text;
    farmer.midName = controllers[4].text;
    farmer.countryCode = countryCode;
    farmer.crop1 = cropsSelected.isNotEmpty ? cropsSelected[0].uuid : null;
    farmer.crop2 = cropsSelected.length > 1 ? cropsSelected[1].uuid : null;
    farmer.crop3 = cropsSelected.length > 2 ? cropsSelected[2].uuid : null;
    farmer.address = controllers[6].text;
    farmer.country = selectedTerritory ?? "India";
    farmer.district = selectedCounty ?? "Ahmedabad";
    farmer.region = [selectedRegion ?? "Gujarat"];
    farmer.territory = [selectedTerritory ?? "India"];
    farmer.subDistrict = selectedSubCounty;
    farmer.village = selectedVillage;
    if (imageFile != null) {
      farmer.profileImage = imageFile!.path;
    }
  }

  Future<void> addCrops(VoidCallback updateState) async {
    try {
      StoreHelper.store.cropsListSelected = cropsSelected;
      
      final result = await Navigator.pushNamed(context, AddCropScreen.routeName);
      
      if (result != null && result is List<CropModelShort> && mounted) {
        // Validate all crops have valid image paths
        final validCrops = result.where((crop) {
          if (crop.imagePath.isEmpty) {
            debugPrint('Invalid image path for crop: ${crop.cropName}');
            return false;
          }
          return true;
        }).toList();
        
        setState(() {
          cropsSelected = validCrops;
        });
      }
    } catch (e) {
      debugPrint('Error in addCrops: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to select crops: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> getData() async {
    try {
      final genderResult = await MasterService.instance
          .getByIndicator(ApiConstants.globalIndicatorForGender);
      if (genderResult.isNotEmpty && mounted) {
        UpdateGenderListMututation(genderResult);
      }

      final educationResult = await MasterService.instance
          .getByIndicator(ApiConstants.globalIndicatorForEducation);
      if (educationResult.isNotEmpty && mounted) {
        UpdateEducationListMututation(educationResult);
      }

      if (mounted) {
        await MasterController.getStringList(StringApiNamesEnum.uom);
        await MasterController.getCrops();
        setState(() {});
      }
    } catch (e) {
      debugPrint('Error loading data: $e');
      if (mounted) {
        StyleHelper.showToast("Failed to load required data");
      }
    }
  }

  Future<void> showDatePickerDialog() async {
    try {
      final time = await showDatePicker(
        context: context,
        initialDate: farmer.dateOfBirth ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (time != null && mounted) {
        setState(() => farmer.dateOfBirth = time);
      }
    } catch (e) {
      debugPrint('Date picker error: $e');
      if (mounted) {
        StyleHelper.showToast("Failed to select date");
      }
    }
  }
}

class CropImageWidget extends StatelessWidget {
  final String imagePath;
  final double size;

  const CropImageWidget({
    required this.imagePath,
    this.size = 40,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imagePath.isEmpty) {
      return _buildErrorWidget();
    }

    if (imagePath.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: imagePath,
        width: size,
        height: size,
        fit: BoxFit.contain,
        placeholder: (context, url) => _buildLoadingWidget(),
        errorWidget: (context, url, error) => _buildErrorWidget(),
      );
    } else {
      return Image.asset(
        imagePath,
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => _buildErrorWidget(),
      );
    }
  }

  Widget _buildLoadingWidget() {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      child: SizedBox(
        width: size * 0.5,
        height: size * 0.5,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.image_not_supported,
        size: size * 0.6,
        color: Colors.grey,
      ),
    );
  }
}