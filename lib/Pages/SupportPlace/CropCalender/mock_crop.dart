// Create mock data classes
class MockCrop {
  final String name;
  final String imageUrl;
  
  MockCrop(this.name, this.imageUrl);
}

class MockCropStage {
  final String stageName;
  final int weekInfo;
  final List<MockTask> tasks;
  
  MockCropStage(this.stageName, this.weekInfo, this.tasks);
}

class MockTask {
  final String operationName;
  final String operationType;
  final String operationDescription;
  final String? imageUrl;
  
  MockTask(this.operationName, this.operationType, this.operationDescription, [this.imageUrl]);
}

// Mock data
final List<MockCrop> mockCrops = [
  MockCrop("Wheat", "https://example.com/wheat.jpg"),
  MockCrop("Rice", "https://example.com/rice.jpg"),
  MockCrop("Corn", "https://example.com/corn.jpg"),
];

final List<MockCropStage> mockWheatStages = [
  MockCropStage("Pre-Seeding", -1, [
    MockTask("Land Preparation", "Primary", "Prepare the land by plowing and leveling", "https://example.com/land-prep.jpg"),
  ]),
  MockCropStage("Seeding", 1, [
    MockTask("Sowing", "Primary", "Sow seeds at proper depth and spacing", "https://example.com/sowing.jpg"),
  ]),
  // Add more stages...
];