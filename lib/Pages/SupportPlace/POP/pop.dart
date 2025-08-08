import 'package:flutter/material.dart';

// POP Model
class PopModel {
  final String id;
  final String title;
  final String cropName;
  final String category;
  final String description;
  final String practiceType;
  final String difficulty;
  final String duration;
  final DateTime lastUpdated;
  final String imageUrl;
  final List<String> tags;
  final String author;
  final double rating;
  final int reviewsCount;
  final bool isSaved;
  final bool isPopular;
  final String estimatedCost;
  final List<String> requiredTools;

  PopModel({
    required this.id,
    required this.title,
    required this.cropName,
    required this.category,
    required this.description,
    required this.practiceType,
    required this.difficulty,
    required this.duration,
    required this.lastUpdated,
    required this.imageUrl,
    required this.tags,
    required this.author,
    required this.rating,
    required this.reviewsCount,
    this.isSaved = false,
    this.isPopular = false,
    required this.estimatedCost,
    required this.requiredTools,
  });

  PopModel copyWith({
    bool? isSaved,
  }) {
    return PopModel(
      id: id,
      title: title,
      cropName: cropName,
      category: category,
      description: description,
      practiceType: practiceType,
      difficulty: difficulty,
      duration: duration,
      lastUpdated: lastUpdated,
      imageUrl: imageUrl,
      tags: tags,
      author: author,
      rating: rating,
      reviewsCount: reviewsCount,
      isSaved: isSaved ?? this.isSaved,
      isPopular: isPopular,
      estimatedCost: estimatedCost,
      requiredTools: requiredTools,
    );
  }
}

class PopScreen extends StatefulWidget {
  static const String routeName = "/pop-screen";
  
  const PopScreen({super.key});

  @override
  State<PopScreen> createState() => _PopScreenState();
}

class _PopScreenState extends State<PopScreen> with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  String _selectedDifficulty = 'All';
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;

  final List<String> _categories = [
    'All', 'Land Preparation', 'Sowing', 'Irrigation', 
    'Fertilization', 'Pest Management', 'Harvesting', 'Post Harvest'
  ];

  final List<String> _difficulties = ['All', 'Easy', 'Medium', 'Hard'];

  // Static POP Data
  List<PopModel> _allPops = [
    PopModel(
      id: '1',
      title: 'Precision Land Preparation for Rice',
      cropName: 'Rice',
      category: 'Land Preparation',
      description: 'Comprehensive guide for optimal land preparation techniques to maximize rice yield with minimal resource waste.',
      practiceType: 'Traditional + Modern',
      difficulty: 'Medium',
      duration: '5-7 days',
      lastUpdated: DateTime.now().subtract(const Duration(days: 2)),
      imageUrl: 'https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?w=400',
      tags: ['Rice', 'Land Prep', 'Precision', 'Yield'],
      author: 'Agricultural Research Institute',
      rating: 4.7,
      reviewsCount: 189,
      isSaved: false,
      isPopular: true,
      estimatedCost: '₹2,500-3,000/acre',
      requiredTools: ['Tractor', 'Leveller', 'Rotavator'],
    ),
    PopModel(
      id: '2',
      title: 'Organic Pest Management for Tomatoes',
      cropName: 'Tomato',
      category: 'Pest Management',
      description: 'Eco-friendly pest control strategies using organic methods and beneficial insects to protect tomato crops.',
      practiceType: 'Organic',
      difficulty: 'Easy',
      duration: '2-3 weeks',
      lastUpdated: DateTime.now().subtract(const Duration(hours: 12)),
      imageUrl: 'https://images.unsplash.com/photo-1592841200221-a6898f307baa?w=400',
      tags: ['Tomato', 'Organic', 'Pest Control', 'Eco-friendly'],
      author: 'Dr. Priya Sharma',
      rating: 4.9,
      reviewsCount: 267,
      isSaved: true,
      isPopular: true,
      estimatedCost: '₹800-1,200/acre',
      requiredTools: ['Sprayer', 'Neem Oil', 'Sticky Traps'],
    ),
    PopModel(
      id: '3',
      title: 'Smart Irrigation Schedule for Wheat',
      cropName: 'Wheat',
      category: 'Irrigation',
      description: 'Optimize water usage with scientifically designed irrigation timing to achieve maximum wheat productivity.',
      practiceType: 'Smart Technology',
      difficulty: 'Medium',
      duration: '90-120 days',
      lastUpdated: DateTime.now().subtract(const Duration(days: 1)),
      imageUrl: 'https://images.unsplash.com/photo-1625246333195-78d9c38ad449?w=400',
      tags: ['Wheat', 'Smart Irrigation', 'Water Management', 'Technology'],
      author: 'Water Management Council',
      rating: 4.6,
      reviewsCount: 143,
      isSaved: false,
      isPopular: false,
      estimatedCost: '₹1,500-2,000/acre',
      requiredTools: ['Drip System', 'Moisture Sensor', 'Timer'],
    ),
    PopModel(
      id: '4',
      title: 'High-Yield Soybean Sowing Technique',
      cropName: 'Soybean',
      category: 'Sowing',
      description: 'Advanced sowing techniques and seed treatment methods for achieving optimal soybean germination and growth.',
      practiceType: 'Hybrid Method',
      difficulty: 'Easy',
      duration: '3-5 days',
      lastUpdated: DateTime.now().subtract(const Duration(days: 4)),
      imageUrl: 'https://images.unsplash.com/photo-1530836639372-8b976ad5c7eb?w=400',
      tags: ['Soybean', 'Sowing', 'High Yield', 'Seed Treatment'],
      author: 'Seed Technology Lab',
      rating: 4.5,
      reviewsCount: 98,
      isSaved: true,
      isPopular: false,
      estimatedCost: '₹1,000-1,500/acre',
      requiredTools: ['Seed Drill', 'Treated Seeds', 'Fertilizer'],
    ),
    PopModel(
      id: '5',
      title: 'Integrated Nutrient Management for Sugarcane',
      cropName: 'Sugarcane',
      category: 'Fertilization',
      description: 'Balanced nutrient program combining organic and inorganic fertilizers for sustainable sugarcane production.',
      practiceType: 'Integrated',
      difficulty: 'Hard',
      duration: '12-15 months',
      lastUpdated: DateTime.now().subtract(const Duration(days: 6)),
      imageUrl: 'https://images.unsplash.com/photo-1516738901171-8eb4fc13bd20?w=400',
      tags: ['Sugarcane', 'Nutrition', 'Integrated', 'Sustainable'],
      author: 'Crop Nutrition Expert',
      rating: 4.8,
      reviewsCount: 201,
      isSaved: false,
      isPopular: true,
      estimatedCost: '₹3,500-4,500/acre',
      requiredTools: ['Soil Tester', 'Spreader', 'Organic Compost'],
    ),
    PopModel(
      id: '6',
      title: 'Mechanical Harvesting Best Practices',
      cropName: 'Multiple',
      category: 'Harvesting',
      description: 'Guidelines for efficient mechanical harvesting to minimize crop loss and maximize quality retention.',
      practiceType: 'Mechanical',
      difficulty: 'Medium',
      duration: '1-2 days',
      lastUpdated: DateTime.now().subtract(const Duration(days: 3)),
      imageUrl: 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=400',
      tags: ['Harvesting', 'Mechanical', 'Efficiency', 'Quality'],
      author: 'Farm Mechanization Unit',
      rating: 4.4,
      reviewsCount: 156,
      isSaved: true,
      isPopular: false,
      estimatedCost: '₹800-1,000/acre',
      requiredTools: ['Harvester', 'Transport Vehicle', 'Storage Bags'],
    ),
  ];

  List<PopModel> _filteredPops = [];
  List<PopModel> _savedPops = [];

  @override
  void initState() {
    super.initState();
    _filteredPops = _allPops;
    _updateSavedPops();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _filterPops() {
    setState(() {
      _filteredPops = _allPops.where((pop) {
        bool matchesSearch = pop.title.toLowerCase()
            .contains(_searchController.text.toLowerCase()) ||
            pop.cropName.toLowerCase()
            .contains(_searchController.text.toLowerCase()) ||
            pop.category.toLowerCase()
            .contains(_searchController.text.toLowerCase());
        
        bool matchesCategory = _selectedCategory == 'All' || 
            pop.category == _selectedCategory;
        
        bool matchesDifficulty = _selectedDifficulty == 'All' || 
            pop.difficulty == _selectedDifficulty;

        return matchesSearch && matchesCategory && matchesDifficulty;
      }).toList();
    });
  }

  void _updateSavedPops() {
    _savedPops = _allPops.where((pop) => pop.isSaved).toList();
  }

  void _toggleSave(PopModel pop) {
    setState(() {
      int index = _allPops.indexWhere((p) => p.id == pop.id);
      if (index != -1) {
        _allPops[index] = _allPops[index].copyWith(isSaved: !_allPops[index].isSaved);
        _updateSavedPops();
        _filterPops();
      }
    });
  }

  void _showFilterDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Filter Practices',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            const Text('Category:', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _categories.map((category) => FilterChip(
                label: Text(category),
                selected: _selectedCategory == category,
                selectedColor: Colors.green[100],
                checkmarkColor: Colors.green[700],
                onSelected: (selected) {
                  setState(() {
                    _selectedCategory = category;
                  });
                  _filterPops();
                },
              )).toList(),
            ),
            
            const SizedBox(height: 24),
            const Text('Difficulty:', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _difficulties.map((difficulty) => FilterChip(
                label: Text(difficulty),
                selected: _selectedDifficulty == difficulty,
                selectedColor: Colors.orange[100],
                checkmarkColor: Colors.orange[700],
                onSelected: (selected) {
                  setState(() {
                    _selectedDifficulty = difficulty;
                  });
                  _filterPops();
                },
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _showSavedPops() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Saved Practices',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            if (_savedPops.isEmpty)
              const Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.bookmark_border, size: 80, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'No saved practices yet',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _savedPops.length,
                  itemBuilder: (context, index) {
                    return _buildCompactPopCard(_savedPops[index]);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return Colors.green;
      case 'medium':
        return Colors.orange;
      case 'hard':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Package of Practices'),
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(_slideAnimation),
        child: FadeTransition(
          opacity: _slideAnimation,
          child: Column(
            children: [
              // Search and Action Bar
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
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
                          onChanged: (value) => _filterPops(),
                          decoration: const InputDecoration(
                            hintText: 'Search practices...',
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    
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
                    const SizedBox(width: 10),
                    
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: _showSavedPops,
                        icon: Stack(
                          children: [
                            Icon(Icons.bookmark_border, color: Colors.green[600]),
                            if (_savedPops.isNotEmpty)
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  constraints: const BoxConstraints(
                                    minWidth: 16,
                                    minHeight: 16,
                                  ),
                                  child: Text(
                                    '${_savedPops.length}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // POP List
              Expanded(
                child: _filteredPops.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_off, size: 80, color: Colors.grey),
                            SizedBox(height: 16),
                            Text(
                              'No practices found',
                              style: TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _filteredPops.length,
                        itemBuilder: (context, index) {
                          final pop = _filteredPops[index];
                          return _buildPopCard(pop, index);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopCard(PopModel pop, int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400 + (index * 100)),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            print('Tapped on POP: ${pop.title}');
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with badges and save button
                Row(
                  children: [
                    if (pop.isPopular)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.orange[300]!, Colors.orange[600]!],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.trending_up, 
                                size: 16, color: Colors.white),
                            const SizedBox(width: 4),
                            const Text('POPULAR', 
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold
                                )),
                          ],
                        ),
                      ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6
                      ),
                      decoration: BoxDecoration(
                        color: _getDifficultyColor(pop.difficulty).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        pop.difficulty.toUpperCase(),
                        style: TextStyle(
                          color: _getDifficultyColor(pop.difficulty),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => _toggleSave(pop),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: pop.isSaved ? Colors.red[50] : Colors.grey[100],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          pop.isSaved ? Icons.bookmark : Icons.bookmark_border,
                          color: pop.isSaved ? Colors.red : Colors.grey,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Title and crop
                Text(
                  pop.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        pop.cropName,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green[700],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      pop.category,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue[600],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Description
                Text(
                  pop.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),

                // Info row
                Row(
                  children: [
                    Icon(Icons.schedule, size: 14, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      pop.duration,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.currency_rupee, size: 14, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      pop.estimatedCost,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(Icons.star, size: 14, color: Colors.amber[600]),
                        const SizedBox(width: 4),
                        Text(
                          pop.rating.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          ' (${pop.reviewsCount})',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Tags
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: pop.tags.take(4).map((tag) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompactPopCard(PopModel pop) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pop.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  pop.cropName,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green[600],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _toggleSave(pop),
            icon: const Icon(Icons.bookmark, color: Colors.red),
          ),
        ],
      ),
    );
  }
}