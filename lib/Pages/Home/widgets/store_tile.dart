import 'package:flutter/material.dart';

class StoreListTile extends StatelessWidget {
  final String? storeName;
  final String? imageUrl;
  final double? distance;
  final bool? isSaved;
  final double? ratings;
  final List<String>? cropList;

  StoreListTile({
    this.storeName,
    this.imageUrl,
    this.distance,
    this.isSaved,
    this.ratings,
    this.cropList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: const [
              BoxShadow(color: Colors.black54),
              BoxShadow(color: Colors.grey),
            ],
            borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: Image.network(
            imageUrl!,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
          ),
          title: Text(storeName!),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Distance: ${distance.toString()} km'),
              Text('Ratings: ${ratings.toString()}'),
              Text('Crop List: ${cropList!.join(' | ')}'),
            ],
          ),
          trailing: Icon(
            isSaved! ? Icons.favorite : Icons.favorite_border,
            color: isSaved! ? Colors.red : null,
          ),
          onTap: () {
            // Handle list tile tap
          },
        ),
      ),
    );
  }
}
