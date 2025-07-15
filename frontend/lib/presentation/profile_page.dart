import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/auth_provider.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController birthdateController;
  late TextEditingController phoneController;

  String? _selectedGender;
  bool isEditing = false;
  bool showDeleteDialog = false;
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    final user = ref.read(authProvider).user;
    firstNameController = TextEditingController(text: user?.firstName ?? '');
    lastNameController = TextEditingController(text: user?.lastName ?? '');
    birthdateController = TextEditingController(text: user?.birthdate?.toIso8601String().split('T').first ?? '');
    if (user?.gender == 'Male' || user?.gender == 'Female') {
    _selectedGender = user?.gender;
    } else {
      _selectedGender = '';
    }
    phoneController = TextEditingController(text: user?.phoneNumber ?? '');
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    birthdateController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _onSave() async {
    if (_formKey.currentState?.validate() ?? false) {
      await ref.read(authProvider.notifier).updateProfile({
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'birthdate': birthdateController.text.isNotEmpty ? birthdateController.text : null,
        'gender': _selectedGender,
        'phone_number': phoneController.text,
      }, _selectedImage?.path);
      setState(() => isEditing = false);
    }
  }

  void _onLogout() async {
    await ref.read(authProvider.notifier).logout();
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  void _onDeleteAccount() async {
    await ref.read(authProvider.notifier).deleteAccount();
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final user = authState.user;

    if (authState.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('No user data')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (!isEditing)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => setState(() => isEditing = true),
            ),
          if (isEditing)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _onSave,
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 16),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!)
                        : (user.profileImage != null && user.profileImage!.isNotEmpty
                            ? NetworkImage(user.profileImage!) as ImageProvider
                            : null),
                    child: (user.profileImage == null || user.profileImage!.isEmpty) && _selectedImage == null
                        ? const Icon(Icons.person, size: 48)
                        : null,
                  ),
                  if (isEditing)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: _pickImage,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: firstNameController,
                enabled: isEditing,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: lastNameController,
                enabled: isEditing,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: birthdateController,
                enabled: isEditing,
                decoration: const InputDecoration(labelText: 'Birth Date (YYYY-MM-DD)'),
              ),
              const SizedBox(height: 12),
              IgnorePointer(
                ignoring: !isEditing,
                child: DropdownButtonFormField<String>(
                  value: _selectedGender,
                  decoration: const InputDecoration(labelText: 'Gender'),
                  items: const [
                    DropdownMenuItem(value: '', child: Text('Select Gender')),
                    DropdownMenuItem(value: 'Male', child: Text('Male')),
                    DropdownMenuItem(value: 'Female', child: Text('Female')),
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  },
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: phoneController,
                enabled: isEditing,
                decoration: const InputDecoration(labelText: 'Mobile'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: user.email,
                enabled: false,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 24),
              if (!isEditing) ...[
                ElevatedButton(
                  onPressed: _onLogout,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('Log Out'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => setState(() => showDeleteDialog = true),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Delete Account'),
                ),
              ],
              if (authState.failure != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    authState.failure!.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: showDeleteDialog
          ? FloatingActionButton.extended(
              onPressed: () => setState(() => showDeleteDialog = false),
              label: const Text('Cancel'),
              icon: const Icon(Icons.close),
            )
          : null,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (showDeleteDialog) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Delete Account'),
          content: const Text('Are you sure you want to delete your account? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () => setState(() => showDeleteDialog = false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() => showDeleteDialog = false);
                _onDeleteAccount();
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      );
    }
  }
} 