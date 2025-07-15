import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/auth_provider.dart';
import '../application/providers/sync_provider.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'admin_dashboard_page.dart';

class GreenLeafApp extends ConsumerWidget {
  const GreenLeafApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final isSyncing = ref.watch(syncProvider);

    return MaterialApp(
      title: 'GreenLeaf',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: authState.isLoading
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : authState.user == null
                ? LoginPage()
                : authState.user!.isSuperuser
                    ? const AdminDashboardPage()
                    : const HomePage(),
      ),
    );
  }
} 