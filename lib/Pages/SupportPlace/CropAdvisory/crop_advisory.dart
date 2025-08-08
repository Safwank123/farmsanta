import 'package:farmsanta_new/Models/SupportPlace/CropAdvisory/crop_advisory_model.dart';
import 'package:flutter/material.dart';

// Advisory Model
class AdvisoryModel {
  final String id;
  final String title;
  final String cropName;
  final String category;
  final String description;
  final String severity;
  final DateTime datePosted;
  final String imageUrl;
  final List<String> tags;
  final String author;
  final bool isUrgent;
  final int likesCount;
  final String estimatedReadTime;

  AdvisoryModel({
    required this.id,
    required this.title,
    required this.cropName,
    required this.category,
    required this.description,
    required this.severity,
    required this.datePosted,
    required this.imageUrl,
    required this.tags,
    required this.author,
    this.isUrgent = false,
    this.likesCount = 0,
    required this.estimatedReadTime,
  });
}

class CropAdvisoryScreen extends StatefulWidget {
  static const routeName = "/crop-advisory-screen";
  
  const CropAdvisoryScreen({super.key});

  @override
  State<CropAdvisoryScreen> createState() => _CropAdvisoryScreenState();
}

class _CropAdvisoryScreenState extends State<CropAdvisoryScreen> 
    with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  String _selectedSeverity = 'All';
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<String> _categories = [
    'All', 'Pest Control', 'Disease Management', 'Irrigation', 
    'Fertilization', 'Weather Alert', 'Harvest'
  ];

  final List<String> _severities = ['All', 'Low', 'Medium', 'High', 'Critical'];

  // Static Advisory Data
  final List<AdvisoryModel> _allAdvisories = [
    AdvisoryModel(
      id: '1',
      title: 'Brown Planthopper Alert in Rice Fields',
      cropName: 'Rice',
      category: 'Pest Control',
      description: 'Increased brown planthopper activity detected. Immediate action required to prevent yield loss.',
      severity: 'Critical',
      datePosted: DateTime.now().subtract(const Duration(hours: 2)),
      imageUrl: 'https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?w=400',
      tags: ['Rice', 'Pest', 'Urgent', 'Planthopper'],
      author: 'Dr. Sarah Chen',
      isUrgent: true,
      likesCount: 156,
      estimatedReadTime: '3 min read',
    ),
    AdvisoryModel(
      id: '2',
      title: 'Optimal Fertilization Schedule for Wheat',
      cropName: 'Wheat',
      category: 'Fertilization',
      description: 'Follow this fertilization schedule to maximize wheat yield during the growing season.',
      severity: 'Medium',
      datePosted: DateTime.now().subtract(const Duration(days: 1)),
      imageUrl: 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?w=400',
      tags: ['Wheat', 'Fertilizer', 'Schedule', 'Yield'],
      author: 'Prof. Michael Johnson',
      isUrgent: false,
      likesCount: 89,
      estimatedReadTime: '5 min read',
    ),
    AdvisoryModel(
      id: '3',
      title: 'Heavy Rain Warning - Protect Your Crops',
      cropName: 'Multiple',
      category: 'Weather Alert',
      description: 'Heavy rainfall expected in the next 48 hours. Take preventive measures to protect your crops.',
      severity: 'High',
      datePosted: DateTime.now().subtract(const Duration(hours: 6)),
      imageUrl: 'https://images.unsplash.com/photo-1515694346937-94d85e41e6f0?w=400',
      tags: ['Weather', 'Rain', 'Prevention', 'Multiple Crops'],
      author: 'Weather Advisory Team',
      isUrgent: true,
      likesCount: 234,
      estimatedReadTime: '2 min read',
    ),
    AdvisoryModel(
      id: '4',
      title: 'Tomato Blight Prevention Techniques',
      cropName: 'Tomato',
      category: 'Disease Management',
      description: 'Learn effective techniques to prevent tomato blight and maintain healthy crop growth.',
      severity: 'Medium',
      datePosted: DateTime.now().subtract(const Duration(days: 2)),
      imageUrl: 'https://images.unsplash.com/photo-1592841200221-a6898f307baa?w=400',
      tags: ['Tomato', 'Blight', 'Prevention', 'Disease'],
      author: 'Dr. Emily Rodriguez',
      isUrgent: false,
      likesCount: 67,
      estimatedReadTime: '4 min read',
    ),
    AdvisoryModel(
      id: '5',
      title: 'Smart Irrigation Tips for Summer',
      cropName: 'Multiple',
      category: 'Irrigation',
      description: 'Optimize water usage and maintain crop health with these smart irrigation strategies.',
      severity: 'Low',
      datePosted: DateTime.now().subtract(const Duration(days: 3)),
      imageUrl: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400',
      tags: ['Irrigation', 'Water', 'Summer', 'Efficiency'],
      author: 'Agricultural Extension Office',
      isUrgent: false,
      likesCount: 142,
      estimatedReadTime: '6 min read',
    ),
  ];

  List<AdvisoryModel> _filteredAdvisories = [];

  @override
  void initState() {
    super.initState();
    _filteredAdvisories = _allAdvisories;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _filterAdvisories() {
    setState(() {
      _filteredAdvisories = _allAdvisories.where((advisory) {
        bool matchesSearch = advisory.title.toLowerCase()
            .contains(_searchController.text.toLowerCase()) ||
            advisory.cropName.toLowerCase()
            .contains(_searchController.text.toLowerCase());
        
        bool matchesCategory = _selectedCategory == 'All' || 
            advisory.category == _selectedCategory;
        
        bool matchesSeverity = _selectedSeverity == 'All' || 
            advisory.severity == _selectedSeverity;

        return matchesSearch && matchesCategory && matchesSeverity;
      }).toList();
    });
  }

  void _showFilterDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filter Advisories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('Category:', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: _categories.map((category) => FilterChip(
                label: Text(category),
                selected: _selectedCategory == category,
                onSelected: (selected) {
                  setState(() {
                    _selectedCategory = category;
                  });
                  _filterAdvisories();
                },
              )).toList(),
            ),
            const SizedBox(height: 16),
            const Text('Severity:', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: _severities.map((severity) => FilterChip(
                label: Text(severity),
                selected: _selectedSeverity == severity,
                onSelected: (selected) {
                  setState(() {
                    _selectedSeverity = severity;
                  });
                  _filterAdvisories();
                },
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Color _getSeverityColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'critical':
        return Colors.red;
      case 'high':
        return Colors.orange;
      case 'medium':
        return Colors.amber;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Crop Advisory'),
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            // Search and Filter Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[600],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) => _filterAdvisories(),
                        decoration: const InputDecoration(
                          hintText: 'Search advisories...',
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: _showFilterDialog,
                      icon: Icon(Icons.filter_list, color: Colors.green[600]),
                    ),
                  ),
                ],
              ),
            ),

            // Advisory List
            Expanded(
              child: _filteredAdvisories.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off, size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'No advisories found',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _filteredAdvisories.length,
                      itemBuilder: (context, index) {
                        final advisory = _filteredAdvisories[index];
                        return _buildAdvisoryCard(advisory, index);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvisoryCard(AdvisoryModel advisory, int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300 + (index * 100)),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Navigate to detail screen
            print('Tapped on advisory: ${advisory.title}');
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with urgency and severity
                Row(
                  children: [
                    if (advisory.isUrgent)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.priority_high, 
                                size: 14, color: Colors.red[700]),
                            const SizedBox(width: 4),
                            Text('URGENT', 
                                style: TextStyle(
                                  color: Colors.red[700],
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold
                                )),
                          ],
                        ),
                      ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4
                      ),
                      decoration: BoxDecoration(
                        color: _getSeverityColor(advisory.severity).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        advisory.severity.toUpperCase(),
                        style: TextStyle(
                          color: _getSeverityColor(advisory.severity),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Title and crop name
                Text(
                  advisory.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  advisory.cropName,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green[600],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),

                // Description
                Text(
                  advisory.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),

                // Tags
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: advisory.tags.take(3).map((tag) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  )).toList(),
                ),
                const SizedBox(height: 12),

                // Footer with author, time, and actions
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.green[100],
                      child: Text(
                        advisory.author.split(' ').map((e) => e[0]).join(),
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            advisory.author,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            _getTimeAgo(advisory.datePosted),
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      advisory.estimatedReadTime,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.favorite_border, 
                            size: 14, color: Colors.grey[400]),
                        const SizedBox(width: 4),
                        Text(
                          advisory.likesCount.toString(),
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}


  List<CropAdvisoryModel> cropAdvisoriesCardList = [];
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
   // getList();
   // super.initState();

  //   //TODO search condition
  //   searchController.addListener(() {
  //     String searchText = searchController.text;
  //     cropAdvisoriesCardList =
  //         StoreHelper.store.cropAdvisoriesList.where((element) {
  //       return element.firstName.contains(searchText);
  //     }).toList();
  //     setState(() {});
  //   });
  // }

  // void getList() {
  //   cropAdvisoriesCardList = StoreHelper.store.cropAdvisoriesList;
  // }

  // void _addFilter() async {
  //   var data = await showModalBottomSheet(

  //     backgroundColor: AppColors.textFieldLintBackground,
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (BuildContext context) {
  //         return const AddFilterScreen().hPCT(context: context, heightPCT: 96);
  //       });
  //   Navigator.pop(context);


  //   if (data != null && data.isNotEmpty) {
  //     var croplist = data[0][0];
  //     var advisoryTag = data[0][1];
  //     var stageList = data[0][2];
  //     cropAdvisoriesCardList =
  //         StoreHelper.store.cropAdvisoriesList.where((element) {
  //       return (croplist.isNotEmpty && croplist.contains(element.crop)) ||
  //           (advisoryTag.isNotEmpty &&
  //               advisoryTag.contains(element.advisoryTagName)) ||
  //           (stageList.isNotEmpty && stageList.contains(element.growthStage));
  //     }).toList();
  //   } else {
  //     getList();
  //   }

  //   setState(() {});
  // }
}
