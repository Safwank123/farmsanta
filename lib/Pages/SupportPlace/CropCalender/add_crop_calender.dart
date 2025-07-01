// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:farmsanta_new/Models/SupportPlace/CropCalender/CropCalender.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:geolocator/geolocator.dart';

import 'package:farmsanta_new/Models/Common/crop_model.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import '../../../Constants/strings.dart';
import '../../../themeFiles/app_colors.dart';


const List<CropModelShort> allCrops = [
  CropModelShort(uuid: '1', cropName: 'Almond', imagePath: 'assets/images/crops/avacado.jpg'),
  CropModelShort(uuid: '2', cropName: 'Avocado', imagePath: 'assets/images/crops/carrot.jpg'),
  CropModelShort(uuid: '3', cropName: 'Banana', imagePath: 'assets/images/crops/mattan.jpg'),
  CropModelShort(uuid: '4', cropName: 'Brinjal', imagePath: 'assets/images/crops/pacha.jpg'),
];

class AddCropCalender extends StatefulWidget {
  static const String routeName = '/add-crop-calender-screen';

  const AddCropCalender({super.key});

  @override
  State<AddCropCalender> createState() => _AddCropCalenderState();
}

class _AddCropCalenderState extends State<AddCropCalender> {
  DateTime selectedDate = DateTime.now();
  CropModelShort? selectedCrop;
  File? selectedImage;
  String? location;

  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  bool _isPickingImage = false;

  @override
  void initState() {
    super.initState();
    _getLocation();
    // Initialize selectedCrop with the first crop for better UX
    if (allCrops.isNotEmpty) {
      selectedCrop = allCrops.first;
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() => selectedDate = picked);
    }
  }

  Future<void> _pickImage() async {
    if (_isPickingImage) return;

    setState(() => _isPickingImage = true);
    try {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked != null) {
        // Ensure widget is still mounted before updating state
        if (mounted) {
          setState(() => selectedImage = File(picked.path));
        }
      }
    } catch (e) {
      debugPrint("Image pick error: $e");
    } finally {
      // Ensure widget is still mounted before updating state
      if (mounted) {
        setState(() => _isPickingImage = false);
      }
    }
  }

  Future<void> _getLocation() async {
    try {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
        final pos = await Geolocator.getCurrentPosition();
        List<Placemark> placemarks = await placemarkFromCoordinates(pos.latitude, pos.longitude);

        // --- FIX for setState() called after dispose() ---
        if (!mounted) return; // Check if the widget is still mounted

        if (placemarks.isNotEmpty) {
          final place = placemarks.first;
          setState(() {
            location = "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
          });
        } else {
          setState(() {
            location = "Lat: ${pos.latitude}, Lng: ${pos.longitude}";
          });
        }
      } else {
        // --- FIX for setState() called after dispose() ---
        if (!mounted) return; // Check if the widget is still mounted
        setState(() => location = "Permission denied");
      }
    } catch (e) {
      // --- FIX for setState() called after dispose() ---
      if (!mounted) return; // Check if the widget is still mounted
      setState(() => location = "Location unavailable");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            textKey: AppStrings.createYourCropCalender,
            style: AppTextStyle.titleLarge.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Crop Selection
              Row(
                children: [
                  Expanded(
                    child: selectedCrop == null
                        ? const Text("No crop selected", style: TextStyle(color: Colors.grey))
                        : _buildCropCard(selectedCrop!),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_drop_down_circle, color: AppColors.primary),
                    onPressed: () => _showCropSelectionBottomSheet(context),
                  )
                ],
              ).pSymmetric(v: 8), // Added vertical padding for better spacing

              // Sowing Date
              20.heightBox,
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_month, color: AppColors.primary),
                      10.widthBox,
                      Text(
                        "Sowing Date: ${DateFormat('dd MMM yyyy').format(selectedDate)}",
                        style: AppTextStyle.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),

              // Crop Duration
              20.heightBox,
              TextField(
                controller: _durationController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Crop Duration (days)",
                  hintText: "e.g., 90",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.timer_outlined),
                ),
              ),

              // Notes
              20.heightBox,
              TextField(
                controller: _noteController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Notes",
                  hintText: "Add any specific notes about this crop or field...",
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                ),
              ),

              // Location
              20.heightBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_pin, color: AppColors.primary),
                  10.widthBox,
                  Expanded(
                    child: Text(
                      location ?? 'Fetching location...',
                      style: AppTextStyle.bodyLarge,
                    ),
                  ),
                ],
              ),

              // Field Image Upload
              20.heightBox,
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _isPickingImage ? null : _pickImage,
                    icon: const Icon(Icons.photo_camera), // Changed icon for field image
                    label: const Text("Upload Field Image"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                  10.widthBox,
                  if (selectedImage != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(selectedImage!, width: 60, height: 60, fit: BoxFit.cover),
                    ),
                ],
              ),

              // Create Crop Calendar Button
              30.heightBox,
              CustomButtonElevated(
                text: AppStrings.createCropCalender,
                onTap: () {
                  // Validate required fields before popping
                  if (selectedCrop == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please select a crop.")),
                    );
                    return;
                  }
                  if (_durationController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter crop duration.")),
                    );
                    return;
                  }
                  // Basic validation for duration to be a positive number
                  final int? duration = int.tryParse(_durationController.text.trim());
                  if (duration == null || duration <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter a valid positive crop duration.")),
                    );
                    return;
                  }


                  final CropCalendar newCalendar = CropCalendar(
                    cropId: selectedCrop!.uuid,
                    cropName: selectedCrop!.cropName,
                    startDate: selectedDate,
                    notes: _noteController.text.trim(),
                    durationInDays: duration, // Use validated duration
                    location: location,
                    imagePath: selectedImage?.path,
                  );
                  Navigator.pop(context, newCalendar);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCropCard(CropModelShort crop) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.greenLight, // Lighter background for selected crop
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primary),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              crop.imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          10.widthBox,
          Text(crop.cropName, style: AppTextStyle.titleMedium.copyWith(color: AppColors.blueDark)),
        ],
      ),
    );
  }

  void _showCropSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => SizedBox(
        height: 350, // Slightly increased height for better scrollability
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Select a Crop",
                style: AppTextStyle.titleLarge.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: allCrops.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (_, index) {
                  final crop = allCrops[index];
                  return GestureDetector(
                    onTap: () {
                      // Check if the widget is still mounted before updating state
                      if (mounted) {
                        setState(() => selectedCrop = crop);
                      }
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            crop.imagePath,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        6.heightBox,
                        Text(
                          crop.cropName,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.bodySmall.copyWith(
                            fontWeight: selectedCrop?.uuid == crop.uuid ? FontWeight.bold : FontWeight.normal,
                            color: selectedCrop?.uuid == crop.uuid ? AppColors.primary : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}