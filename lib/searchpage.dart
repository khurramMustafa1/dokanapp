import 'package:flutter/material.dart';
import 'package:internshipproject2/midel/searchlist.dart';
import 'package:internshipproject2/services/search.dart' show SearchService;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  Searchlist? searchResults;
  bool isLoading = false;

  void searchProducts(String query) async {
    if (query.isEmpty) return;
    setState(() => isLoading = true);

    final result = await SearchService.searchProducts(query);

    setState(() {
      searchResults = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: "Search products...",
            border: InputBorder.none,
          ),
          onSubmitted: searchProducts,
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : (searchResults == null || searchResults!.products!.isEmpty)
          ? const Center(child: Text("No products found"))
          : ListView.builder(
        itemCount: searchResults!.products!.length,
        itemBuilder: (context, index) {
          final product = searchResults!.products![index];
          return ListTile(
            leading: product.image != null
                ? Image.network(product.image!,
                width: 50, height: 50, fit: BoxFit.cover)
                : const Icon(Icons.image_not_supported),
            title: Text(product.name ?? "No name"),
            subtitle: Text("Rs ${product.price ?? 0}"),
          );
        },
      ),
    );
  }
}
