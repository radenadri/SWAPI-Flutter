import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
                : (defaultTargetPlatform == TargetPlatform.iOS)
                    ? const CupertinoActivityIndicator()
                    : const CircularProgressIndicator();
          },
          errorBuilder: errorBuilder ??
              (context, error, stackTrace) {
                return Icon(
                  (defaultTargetPlatform == TargetPlatform.iOS)
                      ? CupertinoIcons.person_alt_circle
                      : Icons.person,
                  size: 30.0,
                );
              },
        ),
      ),
    );
  }
}
