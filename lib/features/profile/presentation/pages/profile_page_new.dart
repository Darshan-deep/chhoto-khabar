import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chhoto_khabar/features/categories/presentation/bloc/category_bloc.dart';
import 'package:chhoto_khabar/features/categories/domain/entities/category.dart';
import 'package:chhoto_khabar/features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:chhoto_khabar/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:chhoto_khabar/features/auth/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:chhoto_khabar/features/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:chhoto_khabar/features/profile/presentation/blocs/profile_bloc/profile_state.dart';
import 'package:chhoto_khabar/features/profile/presentation/blocs/profile_bloc/profile_event.dart';
import 'package:chhoto_khabar/shared/language/presentation/language_bloc/language_bloc.dart';
import 'package:chhoto_khabar/shared/language/domain/model/language_model.dart';

class ProfilePageNew extends StatefulWidget {
  const ProfilePageNew({super.key});

  @override
  State<ProfilePageNew> createState() => _ProfilePageNewState();
}

class _ProfilePageNewState extends State<ProfilePageNew> {
  int _selectedTabIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Load categories, profile, and bookmarks when the page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryBloc>().add(const CategoryEvent.loadCategories());
      context.read<ProfileBloc>().add(const ProfileEvent.checkAuthAndLoad());
      _loadBookmarksWithCurrentLanguage();
    });
  }

  void _loadBookmarksWithCurrentLanguage() {
    final languageBloc = context.read<LanguageBloc>();
    final currentLanguage = languageBloc.state.selectedLanguage;
    final languageCode = currentLanguage == Language.english ? 'en' : 'np';
    
    context.read<BookmarkBloc>().add(
      BookmarkEvent.loadBookmarks(page: 1, language: languageCode),
    );
  }

  void _reloadAllContentWithLanguage(BuildContext context, Language newLanguage) {
    final languageCode = newLanguage == Language.english ? 'en' : 'np';
    
    // Reload bookmarks with new language
    context.read<BookmarkBloc>().add(
      BookmarkEvent.loadBookmarks(page: 1, language: languageCode),
    );
    
    // Reload categories with new language
    context.read<CategoryBloc>().add(
      CategoryEvent.loadCategories(),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5F2F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE5F2F3),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black87),
            onPressed: () {
              // Navigate to settings
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile Header
          _buildProfileHeader(),
          
          // Tab Bar
          _buildTabBar(),
          
          // Content Pages
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
              children: [
                _buildCategoriesTab(),
                _buildBookmarksTab(),
                _buildExistingTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: profileState.when(
            initial: () => _buildProfileContent(null, null, 0),
            checkingAuth: () => const Center(
              child: CircularProgressIndicator(color: Color(0xFF4A9B8C)),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(color: Color(0xFF4A9B8C)),
            ),
            loaded: (profile) => _buildProfileContent(
              profile.email, 
              '${profile.firstName} ${profile.lastName}',
              profile.bookmarksCount,
            ),
            updating: (currentProfile) => _buildProfileContent(
              currentProfile.email, 
              '${currentProfile.firstName} ${currentProfile.lastName}',
              currentProfile.bookmarksCount,
            ),
            updated: (profile) => _buildProfileContent(
              profile.email, 
              '${profile.firstName} ${profile.lastName}',
              profile.bookmarksCount,
            ),
            unauthenticated: () => _buildProfileContent(null, null, 0),
            error: (exception) => _buildProfileContent(null, null, 0),
            updateError: (exception, currentProfile) => _buildProfileContent(
              currentProfile.email, 
              '${currentProfile.firstName} ${currentProfile.lastName}',
              currentProfile.bookmarksCount,
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileContent(String? email, String? username, int bookmarksCount) {
    return Column(
      children: [
        // Profile Avatar
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFF4A9B8C),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF4A9B8C).withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            Icons.person,
            size: 40,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        
        // Username
        Text(
          username ?? 'Guest User',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        
        // Email
        Text(
          email ?? 'guest@chhotokhabar.com',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 16),
        
        // Stats Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatItem('Articles', '12'),
            _buildStatItem('Bookmarks', bookmarksCount.toString()),
            _buildStatItem('Reading', '2h'),
          ],
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF4A9B8C),
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    final tabs = ['Categories', 'Bookmarks', 'Settings'];
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final title = entry.value;
          final isSelected = _selectedTabIndex == index;
          
          return Expanded(
            child: GestureDetector(
              onTap: () => _onTabSelected(index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF4A9B8C) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : Colors.grey[600],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCategoriesTab() {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, languageState) {
        final currentLanguage = languageState.selectedLanguage;
        
        return BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            return state.when(
              initial: () => Center(
                child: Text(
                  currentLanguage == Language.english ? 'Loading...' : 'लोड गर्दै...',
                  style: GoogleFonts.poppins(),
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(color: Color(0xFF4A9B8C)),
              ),
              loaded: (categories, selectedCategory) => _buildCategoriesList(categories, currentLanguage),
              error: (message) => Center(
                child: Text(
                  currentLanguage == Language.english ? 'Error: $message' : 'त्रुटि: $message',
                  style: GoogleFonts.poppins(color: Colors.red),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildCategoriesList(List<Category> categories, Language currentLanguage) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 3,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final categoryName = currentLanguage == Language.english 
              ? category.name.en 
              : category.name.np;
          
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _getCategoryColor(category.colorCode),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      categoryName,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBookmarksTab() {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, languageState) {
        final currentLanguage = languageState.selectedLanguage;
        final languageCode = currentLanguage == Language.english ? 'en' : 'np';
        
        return BlocBuilder<BookmarkBloc, BookmarkState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(
                child: Text('Loading bookmarks...'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(color: Color(0xFF4A9B8C)),
              ),
              loaded: (bookmarks, currentPage, hasMoreData) => bookmarks.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bookmark_border,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            currentLanguage == Language.english 
                              ? 'No bookmarks yet'
                              : 'अहिलेसम्म कुनै बुकमार्क छैन',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            currentLanguage == Language.english
                              ? 'Save articles to read later'
                              : 'पछि पढ्नका लागि लेखहरू सुरक्षित गर्नुहोस्',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: bookmarks.length,
                      itemBuilder: (context, index) {
                        final bookmark = bookmarks[index];
                        // Use selected language for content display
                        String title = currentLanguage == Language.english 
                          ? 'Article ${index + 1}'
                          : 'लेख ${index + 1}';
                        String summary = currentLanguage == Language.english
                          ? 'Bookmarked article from ${bookmark.article.categories.isNotEmpty ? bookmark.article.categories.first.name[languageCode] ?? 'General' : 'General'} category'
                          : 'बुकमार्क गरिएको लेख ${bookmark.article.categories.isNotEmpty ? bookmark.article.categories.first.name[languageCode] ?? 'सामान्य' : 'सामान्य'} श्रेणीबाट';
                        
                        // Try to get content from the selected language
                        if (bookmark.article.content.title.isNotEmpty) {
                          title = bookmark.article.content.title[languageCode] ?? 
                                 bookmark.article.content.title['en'] ?? 
                                 bookmark.article.content.title.values.first;
                        }
                        
                        if (bookmark.article.content.summary.isNotEmpty) {
                          summary = bookmark.article.content.summary[languageCode] ?? 
                                   bookmark.article.content.summary['en'] ?? 
                                   bookmark.article.content.summary.values.first;
                        }
                        
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color(0xFF4A9B8C).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.article,
                                color: Color(0xFF4A9B8C),
                              ),
                            ),
                            title: Text(
                              title,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  summary,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${currentLanguage == Language.english ? 'Published' : 'प्रकाशित'}: ${bookmark.article.publishedAt.substring(0, 10)}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.bookmark, color: Color(0xFF4A9B8C)),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      currentLanguage == Language.english
                                        ? 'Bookmark removal feature coming soon'
                                        : 'बुकमार्क हटाउने सुविधा छिट्टै आउँदैछ',
                                    ),
                                  ),
                                );
                              },
                            ),
                            onTap: () {
                              // TODO: Navigate to article details
                            },
                          ),
                        );
                      },
                    ),
              loadingMore: (bookmarks, currentPage) => ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: bookmarks.length + 1,
                itemBuilder: (context, index) {
                  if (index < bookmarks.length) {
                    final bookmark = bookmarks[index];
                    // Use selected language for content display
                    String title = currentLanguage == Language.english 
                      ? 'Article ${index + 1}'
                      : 'लेख ${index + 1}';
                    String summary = currentLanguage == Language.english
                      ? 'Bookmarked article from ${bookmark.article.categories.isNotEmpty ? bookmark.article.categories.first.name[languageCode] ?? 'General' : 'General'} category'
                      : 'बुकमार्क गरिएको लेख ${bookmark.article.categories.isNotEmpty ? bookmark.article.categories.first.name[languageCode] ?? 'सामान्य' : 'सामान्य'} श्रेणीबाट';
                    
                    // Try to get content from the selected language
                    if (bookmark.article.content.title.isNotEmpty) {
                      title = bookmark.article.content.title[languageCode] ?? 
                             bookmark.article.content.title['en'] ?? 
                             bookmark.article.content.title.values.first;
                    }
                    
                    if (bookmark.article.content.summary.isNotEmpty) {
                      summary = bookmark.article.content.summary[languageCode] ?? 
                               bookmark.article.content.summary['en'] ?? 
                               bookmark.article.content.summary.values.first;
                    }
                    
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4A9B8C).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.article,
                            color: Color(0xFF4A9B8C),
                          ),
                        ),
                        title: Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              summary,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${currentLanguage == Language.english ? 'Published' : 'प्रकाशित'}: ${bookmark.article.publishedAt.substring(0, 10)}',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.bookmark, color: Color(0xFF4A9B8C)),
                          onPressed: () {
                            // TODO: Implement bookmark removal
                          },
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: CircularProgressIndicator(color: Color(0xFF4A9B8C)),
                      ),
                    );
                  }
                },
              ),
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red[300],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      currentLanguage == Language.english
                        ? 'Error loading bookmarks'
                        : 'बुकमार्कहरू लोड गर्न त्रुटि',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.red[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      message,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildExistingTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildSettingsItem(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            onTap: () {},
          ),
          _buildLanguageSettingsItem(),
          _buildSettingsItem(
            icon: Icons.dark_mode_outlined,
            title: 'Theme',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.help_outline,
            title: 'Help & Support',
            onTap: () {},
          ),
          const SizedBox(height: 20),
          _buildSettingsItem(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {
              // Handle logout
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
            isDestructive: true,
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSettingsItem() {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, languageState) {
        final currentLanguage = languageState.selectedLanguage;
        final isEnglish = currentLanguage == Language.english;
        
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            leading: Icon(
              Icons.language_outlined,
              color: Colors.black87,
            ),
            title: Text(
              'Language',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            subtitle: Text(
              isEnglish ? 'English' : 'नेपाली (Nepali)',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            trailing: Switch(
              value: !isEnglish, // Switch is ON for Nepali, OFF for English
              onChanged: (value) {
                final newLanguage = value ? Language.nepali : Language.english;
                context.read<LanguageBloc>().add(ChangeLanguage(selectedLanguage: newLanguage));
                
                // Reload all content with new language
                _reloadAllContentWithLanguage(context, newLanguage);
                
                // Show snackbar to indicate language change
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      value 
                        ? 'भाषा नेपालीमा परिवर्तन गरियो। सामग्री पुनः लोड गर्दै...' // Changed to Nepali
                        : 'Language changed to English. Reloading content...',
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              activeColor: const Color(0xFF4A9B8C),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isDestructive ? Colors.red : const Color(0xFF4A9B8C),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isDestructive ? Colors.red : Colors.black87,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey[400],
        ),
        onTap: onTap,
      ),
    );
  }

  Color _getCategoryColor(String? colorCode) {
    if (colorCode == null || colorCode.isEmpty) {
      return const Color(0xFF4A9B8C);
    }
    try {
      return Color(int.parse(colorCode.replaceFirst('#', '0xFF')));
    } catch (e) {
      return const Color(0xFF4A9B8C);
    }
  }
}
