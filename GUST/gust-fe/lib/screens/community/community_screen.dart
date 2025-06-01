import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/community_provider.dart';

class CommunityScreen extends ConsumerStatefulWidget {
  const CommunityScreen({super.key});

  @override
  ConsumerState<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends ConsumerState<CommunityScreen> {
  String _selectedPeriod = 'weekly';

  @override
  void initState() {
    super.initState();
    _loadRankings();
  }

  void _loadRankings() {
    ref.read(communityProvider.notifier).loadRankings(_selectedPeriod);
  }

  @override
  Widget build(BuildContext context) {
    final communityState = ref.watch(communityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Rankings'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: _selectedPeriod,
            items: const [
              DropdownMenuItem(value: 'weekly', child: Text('Weekly')),
              DropdownMenuItem(value: 'monthly', child: Text('Monthly')),
            ],
            onChanged: (value) {
              setState(() {
                _selectedPeriod = value ?? 'weekly';
              });
              _loadRankings();
            },
          ),
          Expanded(
            child: communityState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : communityState.error != null
                    ? Center(child: Text(communityState.error!))
                    : ListView.builder(
                        itemCount: communityState.rankings.length,
                        itemBuilder: (context, index) {
                          final user = communityState.rankings[index];
                          return ListTile(
                            leading: CircleAvatar(child: Text('${index + 1}')),
                            title: Text(user.username),
                            trailing: Text('${user.totalSugarGrams} g'),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
