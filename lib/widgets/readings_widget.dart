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
                quill.QuillToolbar.basic(
                  controller: controller,
                ),
                const Divider(
                  height: 3,
                  thickness: 3,
                ),
                Expanded(
                  flex: 1,
                  child: quill.QuillEditor.basic(
                    controller: controller,
                    readOnly: false,
                  ),
                ),
              ],
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: FloatingActionButton(
                child: const Icon(Icons.save),
                onPressed: () =>
                    ref.read(readingsProvider(openJournal.id!).notifier).save(
                          data.copyWith(
                            readings: jsonEncode(
                              controller.document.toDelta().toJson(),
                            ),
                          ),
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
