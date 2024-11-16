import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/note.dart';
import '../providers/note_provider.dart';
import '../routes/screen_routes.dart';

class ViewNotePage extends ConsumerWidget {
  final Note note;

  const ViewNotePage({super.key, required this.note});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);
    final currentNote = notes.firstWhere((n) => n.id == note.id, orElse: () => note);

    return Scaffold(
      appBar: AppBar(
        title: const Text('View Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.push(ScreenRoutes.addEditNote, extra: currentNote),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              ref.read(notesProvider.notifier).deleteNote(currentNote);
              context.pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentNote.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              currentNote.content,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
