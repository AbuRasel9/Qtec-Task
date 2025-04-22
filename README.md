Overview
This Flutter application is an e-commerce product listing app that displays products in a grid view with sorting and search functionality. The app features:

Product cards with images, titles, prices, discounts, and ratings

Search functionality to filter products

Sorting options (Price High-Low, Price Low-High, Rating)

Clean, responsive UI design

State management using BLoC pattern

Screenshots
Product Listing View
Product Listing
Main product grid view showing multiple products with images, prices, discounts, and ratings

Sorting Options
Sorting Options
*Bottom sheet showing sorting options (Price High-Low, Price Low-High, Rating)*

Price Low-High Sorting
Price Low-High
Products sorted by price (low to high) with the sorting option selected

No Results View
No Results
Empty state when no products match the search criteria

Features
Product Display:

Grid layout of product cards

Product images with titles

Current price with original price strikethrough

Discount percentage badge

Star ratings with review count

Search Functionality:

Real-time product filtering

Clear search field to reset view

Sorting Options:

Sort by Price (High to Low)

Sort by Price (Low to High)

Sort by Rating

Responsive Design:

Adapts to different screen sizes

Clean card-based layout

Consistent spacing and typography

Technical Details
State Management: BLoC pattern

Dependencies:

flutter_bloc: For state management

equatable: For value equality

Project Structure:

lib/

bloc/: Business logic components

model/: Data models

view/: UI screens and widgets

repository/: Data layer

