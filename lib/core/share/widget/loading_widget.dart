import 'package:flutter/material.dart';
import 'package:learn_flutter_clean/core/app_theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Center(
        child: SizedBox(
          height: 30,width: 30.0,
          child: CircularProgressIndicator(color: secondaryColor,),
        ),
      ),
    );
  }
}
