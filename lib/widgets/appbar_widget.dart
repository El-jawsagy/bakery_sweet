// this is widget shared in almost all screen in app=
// import './bottons_and_text_fields_materials.dart';

//theme and colors
import 'package:bakery_sweet/theme/theme.dart';

//pub and core package
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColors.transparentColor,
      elevation: 0,
      iconTheme: Theme.of(context).iconTheme,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline1.copyWith(
              color: CustomColors.titleBlackColor,
            ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
//  Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               size: 28,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           giveWidthSpace(
//             ctx: context,
//             widthFactor: 0.09,
//           ),
//           Expanded(
//             child: Text(
//               title,
//               style: Theme.of(context).textTheme.headline1.copyWith(
//                     color: CustomColors.titleBlackColor,
//                   ),
//               textAlign: TextAlign.start,
//             ),
//           ),
//         ],
//       ),
//     );