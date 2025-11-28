import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/spacing.dart' show AppSpacing;
import '../../core/theme/typography.dart';

/// Full-screen search modal
class SearchModal extends StatefulWidget {
  final String? initialQuery;
  final String hintText;
  final Function(String)? onSearch;
  final List<String>? recentSearches;

  const SearchModal({
    super.key,
    this.initialQuery,
    this.hintText = 'Search...',
    this.onSearch,
    this.recentSearches,
  });

  @override
  State<SearchModal> createState() => _SearchModalState();

  static Future<void> show({
    required BuildContext context,
    String? initialQuery,
    String hintText = 'Search...',
    Function(String)? onSearch,
    List<String>? recentSearches,
  }) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchModal(
          initialQuery: initialQuery,
          hintText: hintText,
          onSearch: onSearch,
          recentSearches: recentSearches,
        ),
        fullscreenDialog: true,
      ),
    );
  }
}

class _SearchModalState extends State<SearchModal> {
  late TextEditingController _searchController;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialQuery ?? '');
    _query = widget.initialQuery ?? '';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
            hintStyle: AppTypography.body(color: AppColors.textSecondary),
          ),
          style: AppTypography.body(),
          onChanged: (value) {
            setState(() {
              _query = value;
            });
            widget.onSearch?.call(value);
          },
        ),
        actions: [
          if (_query.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _query = '';
                  _searchController.clear();
                });
                widget.onSearch?.call('');
              },
            ),
        ],
      ),
      body: _query.isEmpty && (widget.recentSearches?.isNotEmpty ?? false)
          ? _buildRecentSearches()
          : _buildSearchResults(),
    );
  }

  Widget _buildRecentSearches() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSpacing.l),
          child: Text(
            'Recent Searches',
            style: AppTypography.h3(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.recentSearches?.length ?? 0,
            itemBuilder: (context, index) {
              final searches = widget.recentSearches;
              if (searches == null || index >= searches.length) {
                return const SizedBox.shrink();
              }
              final search = searches[index];
              return ListTile(
                key: ValueKey(search),
                leading: const Icon(Icons.history, color: AppColors.textSecondary),
                title: Text(search),
                onTap: () {
                  setState(() {
                    _query = search;
                    _searchController.text = search;
                  });
                  widget.onSearch?.call(search);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchResults() {
    if (_query.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 64, color: AppColors.textTertiary),
            const SizedBox(height: AppSpacing.l),
            Text(
              'Start typing to search',
              style: AppTypography.body(color: AppColors.textSecondary),
            ),
          ],
        ),
      );
    }

    // TODO: Implement actual search results
    return Center(
      child: Text(
        'Search results for "$_query"',
        style: AppTypography.body(color: AppColors.textSecondary),
      ),
    );
  }
}

