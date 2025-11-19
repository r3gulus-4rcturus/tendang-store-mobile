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
    return TextButton( 
      onPressed: () {
        if (!isSelected) {
          // Trigger a refetch by updating the state
          setState(() {
            _currentFilter = filter;
          });
        }
      },
      style: TextButton.styleFrom(
        backgroundColor: isSelected
            ? Colors.indigo.shade50 
            : Colors.transparent,
        foregroundColor: isSelected 
            ? Color(0xFF3E75E3)
            : Colors.grey.shade700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), 
          side: isSelected
              ? BorderSide(color: Colors.indigo.shade300, width: 1.5) 
              : BorderSide(color: Colors.grey.shade300), 
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Catalogue',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3E75E3),),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Color(0xFF3E75E3),),
      ),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _currentFilter == ProductFilter.mine
                                ? Icons.person_off_outlined
                                : Icons.inventory_2_outlined,
                            size: 60,
                            color: const Color(0xFF3E75E3),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _currentFilter == ProductFilter.mine
                                ? 'You haven\'t added any products yet.'
                                : 'No products found in the catalogue.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                             _currentFilter == ProductFilter.mine
                                ? 'Tap the "+" button to create one.'
                                : '',
                             style: TextStyle(color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => ProductEntryCard(
                        product: snapshot.data![index],
                        onTap: () {
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
    );
  }
}