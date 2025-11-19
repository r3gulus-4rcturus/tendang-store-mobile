import 'package:flutter/material.dart';
import 'package:tendang_store/models/product_entry.dart';
import 'package:tendang_store/widgets/left_drawer.dart';
import 'package:tendang_store/screens/product_detail.dart';
import 'package:tendang_store/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

enum ProductFilter { all, mine }

class ProductEntryListPage extends StatefulWidget {
  final ProductFilter initialFilter;

  const ProductEntryListPage({
    super.key,
    this.initialFilter = ProductFilter.all, // Default = All Products
  });

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  // STATE TO TRACK CURRENT FILTER
  late ProductFilter _currentFilter;

  @override
  void initState() {
    super.initState();
    _currentFilter = widget.initialFilter;
  }

  Future<List<ProductEntry>> fetchProduct(
    CookieRequest request,
    ProductFilter filter,
  ) async {
    String url = 'https://muhammad-lanang-tendangstore.pbp.cs.ui.ac.id/json/';
    if (filter == ProductFilter.mine) {
      url += '?filter=mine';
    }
    final response = await request.get(url);

    // Decode response to json format
    var data = response;

    // Convert json data to ProductEntry objects
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  // WIDGET FOR FILTER BUTTONS
  Widget _buildFilterButton(ProductFilter filter, String text) {
    bool isSelected = _currentFilter == filter;
    return ElevatedButton(
      onPressed: () {
        if (!isSelected) {
          // Trigger a refetch by updating the state
          setState(() {
            _currentFilter = filter;
          });
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Colors.blue.shade700
            : Colors.grey.shade300,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        elevation: isSelected ? 5 : 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(title: const Text('Product Entry List')),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          // FILTER BUTTONS
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFilterButton(ProductFilter.all, "All Products"),
                const SizedBox(width: 10),
                _buildFilterButton(ProductFilter.mine, "My Products"),
              ],
            ),
          ),

          Expanded(
            child: FutureBuilder(
              future: fetchProduct(request, _currentFilter),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Column(
                      children: [
                        Text(
                          'There are no product yet.',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff59A5D8),
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => ProductEntryCard(
                        product: snapshot.data![index],
                        onTap: () {
                          // Navigate to product detail page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                product: snapshot.data![index],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
      // ----------------------------------------
    );
  }
}
