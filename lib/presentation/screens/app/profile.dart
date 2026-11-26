import 'package:app/core/constants/theme/colors.dart';
import 'package:app/models/user.dart';
import 'package:app/presentation/widgets/container.dart';
import 'package:app/presentation/widgets/heading.dart';
import 'package:app/presentation/widgets/profilePicture.dart';
import 'package:app/services/user.service.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Future<User> user = fetchMe();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 40, horizontal: 20),
      child: FutureBuilder<User>(
        future: user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 14,
              children: [
                Column(
                  children: [
                    ProfilePicture(snapshot.data!, size: 60),
                    SecondaryHeading(text: snapshot.data?.name ?? '-'),
                    Text(
                      snapshot.data?.email ?? '',
                      style: TextStyle(color: AppColor.fonts.secondary),
                    ),
                  ],
                ),

                AppContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Member since',
                        style: TextStyle(
                          color: AppColor.fonts.secondary,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Text(
                        snapshot.data?.createdAt
                                ?.toLocal()
                                .toString()
                                .split(' ')
                                .first ??
                            '',
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Text('Loading');
          }
        },
      ),
    );
  }
}
