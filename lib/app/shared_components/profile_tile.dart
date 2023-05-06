import 'package:flutter/material.dart';
import 'package:project_management/app/config/models/profile_model.dart';
import 'package:badges/badges.dart' as badges;
import 'package:project_management/app/constans/app_constants.dart';

class ProfilTile extends StatelessWidget {
  const ProfilTile(
      {required this.data, required this.onPressedNotification, Key? key})
      : super(key: key);

  final ProfileModel? data;
  final Function() onPressedNotification;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading:
          CircleAvatar(backgroundImage: AssetImage(ImageRasterPath.avatar1)),
      title: Text(
        data!.name,
        style: TextStyle(fontSize: 14, color: kFontColorPallets[0]),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        data!.email,
        style: TextStyle(fontSize: 12, color: kFontColorPallets[2]),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: badges.Badge(
        badgeContent: Text(data!.trainings!.length.toString()),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
