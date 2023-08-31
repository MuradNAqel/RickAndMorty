import 'package:breaking_bad/constants/colors.dart';
import 'package:breaking_bad/data/models/charecter.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CharecterCard extends StatelessWidget {
  final Charecter charecter;

  CharecterCard(this.charecter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
      padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: Container(
          color: MyColors.myGrey,
          child: charecter.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: 'assets/images/loadingDots.gif',
                  image: charecter.image,
                  fit: BoxFit.cover,
                )
              : Image.asset('assets/images/loadingDots.gif'),
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            '${charecter.name}',
            style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
