import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      elevation: 0,
      title: Align(
        alignment: Alignment.center,
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.white)),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/whishlist');
            },
            icon: const Icon(Icons.favorite))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
