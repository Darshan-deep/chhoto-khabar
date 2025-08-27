import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/profile_model.dart';
import '../blocs/profile_bloc/profile_bloc.dart';
import '../blocs/profile_bloc/profile_event.dart';
import 'package:chhoto_khabar/features/profile/presentation/widgets/language_selection_widget.dart';

class AuthenticatedProfileView extends StatelessWidget {
  final ProfileModel profile;

  const AuthenticatedProfileView({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A), 
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.wb_sunny_outlined, color: Colors.white),
            onPressed: () {
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ProfileBloc>().add(const ProfileEvent.refreshProfile());
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8),
              
              // Profile Header
              _buildProfileHeader(context),
              
              const SizedBox(height: 12),
              
              // Stats Section
              _buildStatsSection(context),
              
              const SizedBox(height: 12),
              
              // Menu Items
              _buildMenuItems(context),
              
              const SizedBox(height: 12),
              
              // Language Selection
              const LanguageSelectionWidget(),
              
              const SizedBox(height: 12),
              
              // Logout Button
              _buildLogoutButton(context),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    final initials = _getInitials(profile.fullName);
    
    return Column(
      children: [
        // Avatar
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            color: Color(0xFF4A9B8C), // Teal green color
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              initials,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 24),
        
        // User Name
        Text(
          profile.fullName.isNotEmpty ? profile.fullName : 'User Name',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        
        const SizedBox(height: 8),
        
        // User Email
        Text(
          profile.email,
          style: const TextStyle(
            color: Color(0xFF888888),
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem('125', 'Articles\nRead'),
          _buildStatDivider(),
          _buildStatItem('${profile.bookmarksCount}', 'Bookmarks'),
          _buildStatDivider(),
          _buildStatItem('18', 'Comments'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF888888),
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildStatDivider() {
    return Container(
      width: 1,
      height: 40,
      color: const Color(0xFF333333),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return Column(
      children: [
        _buildMenuItem(
          icon: Icons.category_outlined,
          iconColor: const Color(0xFF4A9B8C),
          title: 'Categories',
          onTap: () {
            // Navigate to categories
          },
        ),
        _buildMenuItem(
          icon: Icons.bookmark_outline,
          iconColor: const Color(0xFF4A9B8C),
          title: 'My Bookmarks',
          onTap: ()=>context.push('/bookmarks')
          
        ),
        _buildMenuItem(
          icon: Icons.language_outlined,
          iconColor: const Color(0xFF4A9B8C),
          title: 'Language',
          onTap: () {
            // Navigate to language settings
          },
        ),
        _buildMenuItem(
          icon: Icons.help_outline,
          iconColor: const Color(0xFF4A9B8C),
          title: 'Help & Support',
          onTap: () {
            // Navigate to help
          },
        ),
        _buildMenuItem(
          icon: Icons.info_outline,
          iconColor: const Color(0xFF4A9B8C),
          title: 'About Us',
          onTap: () {
            // Navigate to about
          },
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: iconColor,
          size: 24,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Color(0xFF888888),
          size: 20,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: () => _showLogoutDialog(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE74C3C), // Red color
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Logout',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context, ProfileModel profile) {
    final firstNameController = TextEditingController(text: profile.firstName);
    final lastNameController = TextEditingController(text: profile.lastName);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: firstNameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'First Name',
                labelStyle: const TextStyle(color: Color(0xFF888888)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF444444)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF4A9B8C)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: lastNameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Last Name',
                labelStyle: const TextStyle(color: Color(0xFF888888)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF444444)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF4A9B8C)),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Color(0xFF888888)),
            ),
          ),
          FilledButton(
            onPressed: () {
              final updateData = {
                'first_name': firstNameController.text.trim(),
                'last_name': lastNameController.text.trim(),
              };
              
              context.read<ProfileBloc>().add(
                ProfileEvent.updateProfile(data: updateData),
              );
              
              Navigator.of(context).pop();
            },
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF4A9B8C),
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Logout',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Are you sure you want to logout?',
          style: TextStyle(color: Color(0xFF888888)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Color(0xFF888888)),
            ),
          ),
          FilledButton(
            onPressed:()=>context.push('/login') ,
            // onPressed: () {
            //   Navigator.of(context).pop();
            //   context.read<ProfileBloc>().add(const ProfileEvent.logout());
            // },
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFE74C3C),
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  String _getInitials(String fullName) {
    if (fullName.isEmpty) return 'U';
    
    final names = fullName.trim().split(' ');
    if (names.length == 1) {
      return names[0][0].toUpperCase();
    }
    return '${names[0][0]}${names[names.length - 1][0]}'.toUpperCase();
  }
}