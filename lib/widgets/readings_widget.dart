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
        final controller = data.first.readings == ''
            ? quill.QuillController.basic()
            : quill.QuillController(
                document: quill.Document.fromJson(
                  jsonDecode(
                    data.first.readings,
                  ),
                ),
                selection: const TextSelection.collapsed(offset: 0),
              );
        if (controller.document.isEmpty()) {
          String text = '';
          for (int i = 0; i < openJournal.shape.numCards; i++) {
            text += '$i. ${openJournal.shape.contexts[i]}\n';
          }

          controller.document.insert(0, text);
        }
        return Stack(
          children: [
            Column(
              children: [
                quill.QuillSimpleToolbar(
                  controller: controller,
                  configurations: const quill.QuillSimpleToolbarConfigurations(),
                ),
                Expanded(
                  child: quill.QuillEditor.basic(
                    controller: controller,
                    configurations: const quill.QuillEditorConfigurations(),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    final text = controller.document.toDelta().toJson();
                    ref
                        .read(readingsProvider(openJournal.id!).notifier)
                        .save(data.first.copyWith(readings:jsonEncode(text)));
                  },
                  child: const Icon(Icons.save),
                ),
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
