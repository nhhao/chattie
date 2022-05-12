import 'package:chattie/functions/utils.dart';
import 'package:chattie/utils/constants.dart';
import 'package:chattie/widgets/ui/base_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.tabItem}) : super(key: key);
  final TabItems tabItem;

  @override
  Widget build(BuildContext context) {
    Widget leading() {
      switch (tabItem) {
        case TabItems.contacts:
          return const SizedBox(
            width: 24,
          );
        case TabItems.setting:
          return const SizedBox(width: 24);
        default:
          return const SizedBox(
            width: 24,
          );
      }
    }

    Widget trailing() {
      switch (tabItem) {
        case TabItems.contacts:
          return SvgPicture.asset('assets/icons/linear/add_people.svg');
        case TabItems.setting:
          return SvgPicture.asset('assets/icons/linear/add_people.svg');
        default:
          return SvgPicture.asset('assets/icons/linear/add_people.svg');
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leading(),
              Text(
                capitalize(tabItem.name),
                style: title3TextStyle,
              ),
              trailing(),
            ],
          ),
        ),
        const BaseDivider(),
      ],
    );
  }
}
