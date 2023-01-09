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
      data: (data) => Expanded(
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final controller = data.readings[index] == ''
                ? quill.QuillController.basic()
                : quill.QuillController(
                    document: quill.Document.fromJson(
                      jsonDecode(
                        data.readings[index],
                      ),
                    ),
                    selection: const TextSelection.collapsed(offset: 0),
                  );
            return ExpansionTile(
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      openJournal.shape.contexts[index],
                    ),
                  ),
                  IconButton(
                    onPressed: () async => await ref
                        .read(readingsProvider(openJournal.id!).notifier)
                        .saveWith(
                            json.encode(
                              controller.document.toDelta().toJson(),
                            ),
                            index),
                    icon: const Icon(Icons.save),
                  ),
                ],
              ),
              children: [
                quill.QuillToolbar.basic(
                  controller: controller,
                ),
                Expanded(
                  child: quill.QuillEditor.basic(
                    controller: controller,
                    readOnly: false,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: openJournal.shape.numCards,
        ),
      ),
      error: (error, stackTrace) => Text(
        error.toString(),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
