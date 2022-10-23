import 'package:flutter_riverpod/flutter_riverpod.dart';

final activeHomeWidget = StateProvider<int>(((ref) => 1));
final showLoader = StateProvider<bool>(((ref) => true));
final currentUserId = StateProvider<String>(((ref) => '7ovTA1XwXTmbEc3guCKC'));
