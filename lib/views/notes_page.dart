import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/note_provider.dart';
import '../routes/screen_routes.dart';

class NotesPage extends ConsumerWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content.length > 21 ? '${note.content.substring(0, 21)}...' : note.content),
            onTap: () => context.push(ScreenRoutes.viewNote, extra: note),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => ref.read(notesProvider.notifier).deleteNote(note),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(ScreenRoutes.addEditNote, extra: null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
