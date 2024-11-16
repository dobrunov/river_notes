import 'package:go_router/go_router.dart';
import 'package:river_notes/routes/screen_routes.dart';
import 'package:river_notes/views/add_edit_note_page.dart';
import 'package:river_notes/views/notes_page.dart';
import 'package:river_notes/views/view_note_page.dart';

import '../models/note.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: ScreenRoutes.notes,
    routes: [
      GoRoute(
        path: ScreenRoutes.notes,
        builder: (context, state) => const NotesPage(),
      ),
      GoRoute(
        path: ScreenRoutes.addEditNote,
        builder: (context, state) {
          final note = state.extra as Note?;
          return AddEditNotePage(note: note);
        },
      ),
      GoRoute(
        path: ScreenRoutes.viewNote,
        builder: (context, state) {
          final note = state.extra as Note;
          return ViewNotePage(note: note);
        },
      ),
    ],
  );
}
