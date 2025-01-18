import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onClickSubTitle});

  final String title;
  final String subtitle;
  final void Function() onClickSubTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 16,
          ),
          InkWell(
            child: Text(subtitle,
                style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            onTap: () {
              onClickSubTitle();
            },
          )
        ],
      ),
    );
  }
}
