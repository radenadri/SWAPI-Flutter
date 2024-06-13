import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapi_app/config/constants.dart';

class PeopleDetailView extends ConsumerStatefulWidget {
  const PeopleDetailView({
    super.key,
    required this.id,
  });

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeopleDetailViewState();
}

class _PeopleDetailViewState extends ConsumerState<PeopleDetailView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const CupertinoSliverNavigationBar(
              largeTitle: Text(
                'People Detail',
                style: TextStyle(color: COLOR_PRIMARY),
              ),
              border: null,
              backgroundColor: COLOR_SECONDARY,
            ),
          ];
        },
        body: Center(
          child: Text('People Detail View, id: ${widget.id}'),
        ),
      ),
    );
  }
}
