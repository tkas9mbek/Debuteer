import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/theme/styles.dart';
import '../../core/widget/page_foundation.dart';
import '../../core/widget/shadow_text_button.dart';
import '../../core/widget/titled_widget.dart';
import '../../core/widget/transparent_app_bar.dart';
import 'model/filter_option.dart';
import 'service/filter_option_provider.dart';
import 'service/filtered_list_provider.dart';

class FilterDatabasePage extends ConsumerStatefulWidget {
  const FilterDatabasePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _DatabasePageState();
}

class _DatabasePageState extends ConsumerState<FilterDatabasePage> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _doFilter() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final formValues = _formKey.currentState?.value;
      final options = FilterOption(
        name: (formValues?['name'] ?? '').toString(),
        pgn: (formValues?['pgn'] ?? '').toString(),
      );

      ref.read(filterOptionProvider.state).state = options;
      ref.read(filteredListProvider.notifier).filter(options);

      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final options = ref.watch(filterOptionProvider);

    return PageFoundation(
      unfocusOnTap: true,
      backgroundColor: colorScheme.primary,
      padding: Styles.generalBodyPadding,
      appBar: TransparentAppBar(
        title: 'filter'.tr(),
        actions: [
          ShadowTextButton(
            text: 'clear'.tr(),
            onTap: () => _formKey.currentState?.reset(),
          ),
        ],
      ),
      body: FormBuilder(
        key: _formKey,
        initialValue: <String, dynamic>{
          'name': options.name,
          'pgn': options.pgn,
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitledWidget(
              title: 'name'.tr(),
              child: FormBuilderTextField(
                name: 'name',
                decoration: Styles.formInputDecoration(
                  context,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TitledWidget(
              title: 'pgn'.tr(),
              child: FormBuilderTextField(
                name: 'pgn',
                decoration: Styles.formInputDecoration(
                  context,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Padding(
              padding: Styles.generalBodyPadding.copyWith(
                top: 0,
                bottom: 15,
              ),
              child: ShadowTextButton(
                text: 'search'.tr(),
                onTap: _doFilter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
