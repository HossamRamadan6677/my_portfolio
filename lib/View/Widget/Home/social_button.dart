import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SocialButton extends StatelessWidget {
  IconData icon;
  Function onTap;
  SocialButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);
    
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () async => await onTap(),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.all(10),
          child: Icon(icon),
        ),
      ),
    );
  }
}
