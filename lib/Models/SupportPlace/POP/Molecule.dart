class Molecule {
  String moleculeName;
  int moleculePercentageByVolume;
  String moleculeStructure;

  Molecule({
    required this.moleculeName,
    required this.moleculePercentageByVolume,
    required this.moleculeStructure,
  });

  factory Molecule.fromJson(Map<String, dynamic> json) => Molecule(
        moleculeName:
            json["moleculeName"] != null ? json["moleculeName"] as String : '',
        moleculePercentageByVolume: json["moleculePercentageByVolume"] != null
            ? json["moleculePercentageByVolume"].toInt()
            : 0,
        moleculeStructure: json["moleculeStructure"] != null
            ? json["moleculeStructure"] as String
            : '',
      );

  Map<String, dynamic> toJson() => {
        "moleculeName": moleculeName,
        "moleculePercentageByVolume": moleculePercentageByVolume,
        "moleculeStructure": moleculeStructure,
      };
}
