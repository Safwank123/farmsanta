import 'package:flutter/material.dart';

class FertilizerCalculator extends StatefulWidget {
  static String routeName = '/fertilizer-calculator-screen';
  const FertilizerCalculator({super.key});

  @override
  State<FertilizerCalculator> createState() => _FertilizerCalculatorState();
}

class _FertilizerCalculatorState extends State<FertilizerCalculator> {
  // Static data for fertilizer recommendations
  final List<FertilizerRecommendation> staticFertilizerData = [
    FertilizerRecommendation(
      id: 1,
      cropName: "Tomato",
      areaPerPlant: 1.5,
      createdDate: "15 Jan 2024",
      imageUrl: "https://images.unsplash.com/photo-1546470427-e26b92b3ba40?w=500",
      fertilizers: {
        "FYM": FertilizerDetail(quantity: 2.5, unit: "ton"),
        "Bone Meal": FertilizerDetail(quantity: 25, unit: "kg"),
        "Urea (46-0-0)": FertilizerDetail(quantity: 15, unit: "kg"),
        "Neem Karanj Cake": FertilizerDetail(quantity: 20, unit: "kg"),
        "Muriate of Potash": FertilizerDetail(quantity: 12, unit: "kg"),
        "Zinc Sulphate": FertilizerDetail(quantity: 5, unit: "kg"),
        "DAP": FertilizerDetail(quantity: 18, unit: "kg"),
        "Borax": FertilizerDetail(quantity: 3, unit: "kg"),
      },
    ),
    FertilizerRecommendation(
      id: 2,
      cropName: "Rice",
      areaPerPlant: 2.0,
      createdDate: "12 Jan 2024",
      imageUrl: "https://images.unsplash.com/photo-1586201375761-83865001e31c?w=500",
      fertilizers: {
        "FYM": FertilizerDetail(quantity: 3.0, unit: "ton"),
        "Bone Meal": FertilizerDetail(quantity: 30, unit: "kg"),
        "Urea (46-0-0)": FertilizerDetail(quantity: 20, unit: "kg"),
        "Neem Karanj Cake": FertilizerDetail(quantity: 25, unit: "kg"),
        "Muriate of Potash": FertilizerDetail(quantity: 15, unit: "kg"),
        "Zinc Sulphate": FertilizerDetail(quantity: 8, unit: "kg"),
        "DAP": FertilizerDetail(quantity: 22, unit: "kg"),
        "Borax": FertilizerDetail(quantity: 4, unit: "kg"),
      },
    ),
    FertilizerRecommendation(
      id: 3,
      cropName: "Wheat",
      areaPerPlant: 1.2,
      createdDate: "10 Jan 2024",
      imageUrl: "https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?w=500",
      fertilizers: {
        "FYM": FertilizerDetail(quantity: 2.0, unit: "ton"),
        "Bone Meal": FertilizerDetail(quantity: 20, unit: "kg"),
        "Urea (46-0-0)": FertilizerDetail(quantity: 18, unit: "kg"),
        "Neem Karanj Cake": FertilizerDetail(quantity: 15, unit: "kg"),
        "Muriate of Potash": FertilizerDetail(quantity: 10, unit: "kg"),
        "Zinc Sulphate": FertilizerDetail(quantity: 6, unit: "kg"),
        "DAP": FertilizerDetail(quantity: 16, unit: "kg"),
        "Borax": FertilizerDetail(quantity: 2, unit: "kg"),
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Fertilizer Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color(0xFF4CAF50),
        foregroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          _buildHeaderSection(),
          
          // Saved Recommendations Title
          _buildSectionTitle(),
          
          // Fertilizer Cards List
          Expanded(
            child: _buildFertilizerCardsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF4CAF50),
            const Color(0xFF66BB6A),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Calculate the correct quantity of fertilizer your crop needs',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton.icon(
                    onPressed: () {
                      _showCalculatorDialog();
                    },
                    icon: const Icon(Icons.calculate, size: 18),
                    label: const Text('Calculate Fertilizer'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4CAF50),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 2,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Hero(
                tag: 'fertilizer-calculator-hero',
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?w=500',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.green[100],
                          child: const Icon(
                            Icons.agriculture,
                            size: 50,
                            color: Colors.green,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 25,
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Saved Fertilizer Recommendations',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFertilizerCardsList() {
    if (staticFertilizerData.isEmpty) {
      return _buildEmptyState();
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        children: staticFertilizerData.map((recommendation) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildFertilizerCard(recommendation),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.eco,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No recommendations yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Calculate fertilizer for your crops to see recommendations here',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFertilizerCard(FertilizerRecommendation recommendation) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Header
          _buildCardHeader(recommendation),
          
          // Fertilizer Table
          _buildFertilizerTable(recommendation),
          
          // View Details Button
          _buildViewDetailsButton(recommendation),
        ],
      ),
    );
  }

  Widget _buildCardHeader(FertilizerRecommendation recommendation) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          // Background Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.network(
              recommendation.imageUrl,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.green[100],
                  child: const Center(
                    child: Icon(
                      Icons.agriculture,
                      size: 60,
                      color: Colors.green,
                    ),
                  ),
                );
              },
            ),
          ),
          
          // Gradient Overlay
          Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          
          // More Options Icon
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                onPressed: () => _showOptionsMenu(recommendation),
                icon: const Icon(Icons.more_vert),
                iconSize: 20,
                padding: const EdgeInsets.all(8),
              ),
            ),
          ),
          
          // Crop Name Badge
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                '${recommendation.cropName} (${recommendation.areaPerPlant} x ${recommendation.areaPerPlant} m)',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          
          // Date
          Positioned(
            bottom: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                recommendation.createdDate,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFertilizerTable(FertilizerRecommendation recommendation) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Table Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50).withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: const Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'Fertilizer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Quantity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Unit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Table Content
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Column(
              children: recommendation.fertilizers.entries.map((entry) {
                bool isLast = entry.key == recommendation.fertilizers.keys.last;
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    border: !isLast
                        ? Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.1)))
                        : null,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          entry.key,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          entry.value.quantity.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          entry.value.unit,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewDetailsButton(FertilizerRecommendation recommendation) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: ElevatedButton.icon(
        onPressed: () => _viewDetails(recommendation),
        icon: const Icon(Icons.visibility, size: 16),
        label: const Text('View Details'),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4CAF50),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 2,
        ),
      ),
    );
  }

  void _showCalculatorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Fertilizer Calculator'),
          content: const Text('This feature will help you calculate the exact amount of fertilizer needed for your crops. Feature coming soon!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showOptionsMenu(FertilizerRecommendation recommendation) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit, color: Colors.blue),
                title: const Text('Edit Recommendation'),
                onTap: () {
                  Navigator.pop(context);
                  // Edit functionality
                },
              ),
              ListTile(
                leading: const Icon(Icons.share, color: Colors.green),
                title: const Text('Share'),
                onTap: () {
                  Navigator.pop(context);
                  // Share functionality
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Delete'),
                onTap: () {
                  Navigator.pop(context);
                  // Delete functionality
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _viewDetails(FertilizerRecommendation recommendation) {
    // Navigate to detailed view
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FertilizerDetailScreen(recommendation: recommendation),
      ),
    );
  }
}

// Data Models
class FertilizerRecommendation {
  final int id;
  final String cropName;
  final double areaPerPlant;
  final String createdDate;
  final String imageUrl;
  final Map<String, FertilizerDetail> fertilizers;

  FertilizerRecommendation({
    required this.id,
    required this.cropName,
    required this.areaPerPlant,
    required this.createdDate,
    required this.imageUrl,
    required this.fertilizers,
  });
}

class FertilizerDetail {
  final double quantity;
  final String unit;

  FertilizerDetail({
    required this.quantity,
    required this.unit,
  });
}

// Detail Screen
class FertilizerDetailScreen extends StatelessWidget {
  final FertilizerRecommendation recommendation;

  const FertilizerDetailScreen({super.key, required this.recommendation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${recommendation.cropName} Details'),
        backgroundColor: const Color(0xFF4CAF50),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Crop Image
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  recommendation.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.green[100],
                      child: const Center(
                        child: Icon(
                          Icons.agriculture,
                          size: 80,
                          color: Colors.green,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Crop Info
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Crop Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.agriculture, color: Colors.green),
                        const SizedBox(width: 8),
                        Text('Crop: ${recommendation.cropName}'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.square_foot, color: Colors.blue),
                        const SizedBox(width: 8),
                        Text('Area: ${recommendation.areaPerPlant} x ${recommendation.areaPerPlant} m'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, color: Colors.orange),
                        const SizedBox(width: 8),
                        Text('Created: ${recommendation.createdDate}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Detailed Fertilizer Table
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Fertilizer Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Table(
                      border: TableBorder.all(color: Colors.grey.withOpacity(0.3)),
                      children: [
                        const TableRow(
                          decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
                          children: [
                            Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                'Fertilizer',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                'Quantity',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                'Unit',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        ...recommendation.fertilizers.entries.map((entry) {
                          return TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(entry.key),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  entry.value.quantity.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  entry.value.unit,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}