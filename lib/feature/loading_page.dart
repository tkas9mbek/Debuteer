import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/routing/route_paths.dart';
import '../core/theme/sizes.dart';
import 'database/service/database_provider.dart';

class LoadingPage extends ConsumerStatefulWidget {
  const LoadingPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoadingPageState();
}

class _LoadingPageState extends ConsumerState<LoadingPage> {
  Future<void> _init(VoidCallback onSuccess) async {
    await ref.read(databaseProvider.notifier).init();

    onSuccess.call();
  }

  @override
  void initState() {
    super.initState();

    _init(() => context.go(routeToHome));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final fullWidth = Sizes.fullWidth(context);

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: Center(
        child: SizedBox(
          height: fullWidth * 0.17,
          width: fullWidth * 0.17,
          child: CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(colorScheme.onPrimary),
            strokeWidth: fullWidth * 0.02,
          ),
        ),
      ),
    );
  }
}
