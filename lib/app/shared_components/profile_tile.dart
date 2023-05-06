import 'package:flutter/material.dart';
import 'package:project_management/app/config/models/profile_model.dart';
import 'package:badges/badges.dart' as badges;
import 'package:project_management/app/constans/app_constants.dart';

class ProfilTile extends StatelessWidget {
  const ProfilTile({required this.data, Key? key}) : super(key: key);

  final ProfileModel? data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading:
          CircleAvatar(backgroundImage: AssetImage(ImageRasterPath.avatar1)),
      title: Text(
        (data!.name != null) ? data!.name : "NULL",
        style: TextStyle(fontSize: 14, color: kFontColorPallets[0]),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        (data!.email != null) ? data!.email : "NULL",
        style: TextStyle(fontSize: 12, color: kFontColorPallets[2]),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: badges.Badge(
        badgeContent: Text((data!.trainings! != null)
            ? data!.trainings!.length.toString()
            : "NULL"),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
