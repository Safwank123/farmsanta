import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Models/Common/crop_model.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/app_bar.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';

import '../../base_screen.dart';

class AddCropScreen extends BaseScreen {
  static const routeName = "/add-crop";
  static const maxSelectedCrops = 8; // Made this a constant for maintainability
  
  const AddCropScreen({super.key});

  @override
  BaseScreenState<AddCropScreen> createState() => _AddCropScreenState();
}

class _AddCropScreenState extends BaseScreenState<AddCropScreen> {
  // Made crops final since it shouldn't change
 static const List<CropModelShort> allCrops = [
  CropModelShort(uuid: '1', cropName: 'Almond', imagePath: 'assets/images/crops/avacado.jpg'),
  CropModelShort(uuid: '2', cropName: 'Avocado', imagePath: 'assets/images/crops/carrot.jpg'),
  CropModelShort(uuid: '3', cropName: 'Banana', imagePath: 'assets/images/crops/mattan.jpg'),
  CropModelShort(uuid: '4', cropName: 'Brinjal', imagePath: 'assets/images/crops/pacha.jpg'),
  CropModelShort(uuid: '5', cropName: 'Cabbage', imagePath: 'assets/images/crops/qf.jpg'),
  CropModelShort(uuid: '6', cropName: 'Chilli', imagePath: 'assets/images/crops/tommato.jpg'),
  CropModelShort(uuid: '7', cropName: 'Barley', imagePath: 'assets/images/crops/tommato.jpg'),
  CropModelShort(uuid: '8', cropName: 'Bean', imagePath: 'assets/images/crops/ulli.jpg'),
];

  final List<CropModelShort> selectedCrops = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _precacheImages();
  }

  void _precacheImages() {
    for (final crop in allCrops) {
      precacheImage(AssetImage(crop.imagePath), context);
    }
  }

  void _toggleCropSelection(CropModelShort crop) {
    setState(() {
      if (selectedCrops.contains(crop)) {
        selectedCrops.remove(crop);
      } else if (selectedCrops.length < AddCropScreen.maxSelectedCrops) {
        selectedCrops.add(crop);
      }
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    final primaryColor = getColor(AppThemeColorsEnum.primary);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBarDesigns.getAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    textKey: AppStrings.selectCrops,
                    bold: true,
                  ),
                  Text(
                    "${selectedCrops.length}/${AddCropScreen.maxSelectedCrops}",
                    style: textTheme.bodyLarge?.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                'You can change this later.',
                style: textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: allCrops.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final crop = allCrops[index];
                  final isSelected = selectedCrops.contains(crop);

                  return _CropItem(
                    crop: crop,
                    isSelected: isSelected,
                    primaryColor: primaryColor,
                    onTap: () => _toggleCropSelection(crop),
                  );
                },
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: CustomButtonElevated(
                  text: AppStrings.done,
                  onTap: () => Navigator.pop(context, selectedCrops),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CropItem extends StatelessWidget {
  final CropModelShort crop;
  final bool isSelected;
  final Color primaryColor;
  final VoidCallback onTap;

  const _CropItem({
    required this.crop,
    required this.isSelected,
    required this.primaryColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? primaryColor : Colors.grey.shade300,
                width: 2,
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: _CropImage(imagePath: crop.imagePath),
          ),
          const SizedBox(height: 6),
          Text(
            crop.cropName,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _CropImage extends StatelessWidget {
  final String imagePath;

  const _CropImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // First check if path is empty
    if (imagePath.isEmpty) {
      return _buildErrorWidget();
    }

    try {
      return Image.asset(
        imagePath,
        width: 40,
        height: 40,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          debugPrint('Failed to load image: $imagePath');
          return _buildErrorWidget();
        },
      );
    } catch (e) {
      debugPrint('Image loading error: $e');
      return _buildErrorWidget();
    }
  }

  Widget _buildErrorWidget() {
    return const Icon(
      Icons.image_not_supported,
      size: 40,
      color: Colors.grey,
    );
  }
}