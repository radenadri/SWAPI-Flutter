import 'package:flutter/cupertino.dart';
import 'package:swapi/config/constants.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    this.url = 'assets/images/avatar.png',
    this.errorBuilder,
  });

  final String url;
  final ImageErrorWidgetBuilder? errorBuilder;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: ClipOval(
        child: Image.asset(
          url,
          fit: BoxFit.fill,
          frameBuilder: (
            context,
            child,
            frame,
            wasSynchronouslyLoaded,
          ) {
            return frame != null
                ? child
                : const CupertinoActivityIndicator(color: COLOR_PRIMARY);
          },
          errorBuilder: errorBuilder ??
              (context, error, stackTrace) {
                return const Icon(
                  CupertinoIcons.person_alt_circle,
                  size: 30.0,
                );
              },
        ),
      ),
    );
  }
}
