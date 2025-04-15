import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.clear_all),
            onPressed: () {
              // Handle clear all action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Wishlist",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Replace with dynamic wishlist items
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3, // Replace with your dynamic data
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: Image.asset("assets/product_image.png", width: 50),
                    title: Text("Product Name"),
                    subtitle: Text("\$199.99"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.shopping_cart),
                          onPressed: () {
                            // Add item to Cart
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            // Remove item from wishlist
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            // If no items in wishlist
            if (true) // Replace with condition to check if wishlist is empty
              Center(
                child: Text(
                  "Your wishlist is empty.",
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
              ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navigate to Cart or Checkout
              },
              child: Text("Go to Cart"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
