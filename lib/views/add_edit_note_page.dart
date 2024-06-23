import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/note.dart';
import '../providers/notes_provider.dart';

class AddEditNotePage extends ConsumerWidget {
  final Note? note;
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  AddEditNotePage({super.key, this.note}) {
    if (note != null) {
      _titleController.text = note!.title;
      _contentController.text = note!.content;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note == null ? 'Add Note' : 'Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: 'Content'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text;
                final content = _contentController.text;

                if (title.isNotEmpty && content.isNotEmpty) {
                  if (note == null) {
                    ref.read(notesProvider.notifier).addNote(
                          title,
                          content,
                        );
                  } else {
                    final updatedNote = note!.copyWith(
                      title: title,
                      content: content,
                    );
                    ref.read(notesProvider.notifier).updateNote(updatedNote);
                  }

                  Navigator.pop(context);
                }
              },
              child: Text(note == null ? 'Add Note' : 'Update Note'),
            ),
          ],
        ),
      ),
    );
  }
}
