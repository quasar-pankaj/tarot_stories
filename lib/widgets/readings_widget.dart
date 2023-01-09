import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/journals/open_journal_provider.dart';
import '../providers/readings/readings_provider.dart';

class ReadingsWidget extends ConsumerWidget {
  const ReadingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final openJournal = ref.watch(openJournalProvider)!;
    final readings = ref.watch(readingsProvider(openJournal.id!));

    return readings.when(
      data: (data) {
        final controller = data.readings == ''
            ? quill.QuillController.basic()
            : quill.QuillController(
                document: quill.Document.fromJson(
                  jsonDecode(
                    data.readings,
                  ),
                ),
                selection: const TextSelection.collapsed(offset: 0),
              );
        if (controller.document.isEmpty()) {
          for (int i = 0; i < openJournal.shape.numCards; i++) {
            controller.document
                .insert(i, '$i) ${openJournal.shape.contexts[i]}');
          }
        }
        return Column(
          children: [
            quill.QuillToolbar.basic(
              controller: controller,
            ),
            Expanded(
              flex: 1,
              child: quill.QuillEditor.basic(
                controller: controller,
                readOnly: false,
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) => Text(
        error.toString(),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
