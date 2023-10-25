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
            quill.QuillProvider(
              configurations: quill.QuillConfigurations(
                controller: controller,
                sharedConfigurations: const quill.QuillSharedConfigurations(
                  locale: Locale('en', 'US'),
                ),
              ),
              child: Column(
                children: [
                  const quill.QuillToolbar(),
                  const Divider(
                    height: 3,
                    thickness: 3,
                  ),
                  Expanded(
                    flex: 1,
                    child: quill.QuillEditor.basic(
                      configurations: const quill.QuillEditorConfigurations(
                        readOnly: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: FloatingActionButton(
                child: const Icon(Icons.save),
                onPressed: () =>
                    ref.read(readingsProvider(openJournal.id!).notifier).save(
                          data.first.copyWith(
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
