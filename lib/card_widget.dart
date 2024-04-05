import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String? title;
  final String? des;

  const CardWidget({super.key, this.title, this.des});

  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return Card(
      margin: const EdgeInsets.all(
        8.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              height: 1.0,
              color: Colors.grey,
              thickness: 1.0,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(des!),
          ],
        ),
      ),
    );
  }
}
