import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movie_databases/modules/account/view_model/account_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key, required this.viewModel});

  final AccountViewModel viewModel;

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchAccount();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        final account = widget.viewModel.account;

        if (account == null) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          );
        }

        String? avatarUrl;
        if (account.avatarPath?.isNotEmpty == true) {
          avatarUrl = 'https://image.tmdb.org/t/p/w500${account.avatarPath}';
        } else if (account.gravatarHash.isNotEmpty) {
          avatarUrl = 'https://www.gravatar.com/avatar/${account.gravatarHash}';
        }

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 240,
                floating: false,
                pinned: true,
                backgroundColor: Theme.of(context).colorScheme.primary,
                elevation: 2,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: const EdgeInsets.only(bottom: 16.0),
                  title: Text(
                    account.username,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(1, 1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Gradient Background
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.8),
                              Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.9),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      // Optional Image Overlay
                      if (account.avatarPath != null)
                        Opacity(
                          opacity: 0.3,
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${account.avatarPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                    ],
                  ),
                ),
                leading: Container(
                  margin: const EdgeInsets.all(
                      8), // Add some spacing around the icon
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .colorScheme
                        .surface
                        .withOpacity(0.8), // Semi-transparent background
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: Theme.of(context).colorScheme.onSurface),
                    onPressed: () => context.pop(),
                    tooltip: 'Back',
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Transform.translate(
                  offset: const Offset(0, -60),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 100),
                        // Profile Avatar
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: CircleAvatar(
                              radius: 58,
                              backgroundImage: avatarUrl != null
                                  ? CachedNetworkImageProvider(avatarUrl)
                                  : const AssetImage(
                                          'assets/default_avatar.png')
                                      as ImageProvider,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildInfoRow(
                                  Icons.person,
                                  'Name',
                                  account.name?.isEmpty ?? true
                                      ? 'Not Provided'
                                      : account.name!,
                                ),
                                const Divider(height: 24),
                                _buildInfoRow(
                                  Icons.language,
                                  'Language',
                                  account.iso6391.toUpperCase(),
                                ),
                                const Divider(height: 24),
                                _buildInfoRow(
                                  Icons.location_on,
                                  'Country',
                                  account.iso31661.toUpperCase(),
                                ),
                                const Divider(height: 24),
                                _buildInfoRow(
                                  Icons.visibility,
                                  'Adult Content',
                                  account.includeAdult ? 'Enabled' : 'Disabled',
                                  iconColor: account.includeAdult
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                         SizedBox(
                          width: double.infinity,
                          child: Text(
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                            '*Unfortunately, you can\'t update your account details yet. But you can do it on the TMDB website.',
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Logout Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => _logoutAlertDialog(context),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade400,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(Icons.logout),
                            label: const Text(
                              'Log Out',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value,
      {Color? iconColor}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24,
          color: iconColor ?? Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _logoutAlertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to logout?'),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async => await widget.viewModel.logout(),
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
