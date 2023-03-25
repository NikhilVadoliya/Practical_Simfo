import 'package:simform_practical/data/model/user.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  final User user;

  const UserListItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name.fullName,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(user.email, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(
            user.phone,
          )
        ],
      ),
    );
  }
}
