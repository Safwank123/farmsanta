

import 'package:farmsanta_new/Models/MarketPlace/store_model.dart';

final List<StoreModel> storeData = [
StoreModel.fromJson(
  {
    "id": "1",
    "name": "Store A",
    "rating": 4.5,
    "reviews": [
      {
        "avatar": "https://businessfinder.me/wp-content/uploads/2021/06/44.jpg",
        "username": "User1",
        "storeId": "1",
        "productId": "1",
        "rating": 4,
        "isLiked": true,
        "review": "Great store!"
      },
      {
        "avatar": "avatar2.jpg",
        "username": "User2",
        "storeId": "1",
        "productId": "2",
        "rating": 5,
        "isLiked": false,
        "review": "Amazing products!"
      }
    ],
    "image": "https://businessfinder.me/wp-content/uploads/2021/06/44.jpg",
    "kmAway": 2.5,
    "address": "123 Main St",
    "contact": "123-456-7890",
    "activeHours": 8,
    "categories": [
      {
        "img": "https://businessfinder.me/wp-content/uploads/2021/06/44.jpg",
        "name": "Category A"
      },
      {
        "img": "https://businessfinder.me/wp-content/uploads/2021/06/44.jpg",
        "name": "Category B"
      }
    ],
    "products": [
      {
        "name": "Product A",
        "rating": "4.8",
        "reviews": [
          {
            "avatar": "avatar3.jpg",
            "username": "User3",
            "storeId": "1",
            "productId": "1",
            "rating": 5,
            "isLiked": true,
            "review": "Excellent product!"
          }
        ],
        "image": "https://businessfinder.me/wp-content/uploads/2021/06/44.jpg",
        "categoryId": "1",
        "offersId": {
          "id": "1",
          "name": "20% Off",
          "percentageOff": 20
        },
        "amount": 10.99,
        "rentalUnit": null,
        "quantity": 20,
        "variants": [
          {
            "productID": "1",
            "CategoryID": "1",
            "variantName": "Variant 1",
            "price": 9.99,
            "discount": 0
          },
          {
            "productID": "1",
            "CategoryID": "1",
            "variantName": "Variant 2",
            "price": 12.99,
            "discount": 0
          }
        ]
      },
      {
        "name": "Product B",
        "rating": "4.5",
        "reviews": [],
        "image": "https://businessfinder.me/wp-content/uploads/2021/06/44.jpg",
        "categoryId": "2",
        "offersId": null,
        "amount": 15.99,
        "rentalUnit": "day",
        "quantity": 10,
        "variants": [
          {
            "productID": "2",
            "CategoryID": "2",
            "variantName": "Variant 1",
            "price": 14.99,
            "discount": 0
          }
        ]
      }
    ],
    "offers": [
      {
        "id": "1",
        "name": "20% Off",
        "percentageOff": 20,
        "amountOff": null
      },
      {
        "id": "2",
        "name": "Free Shipping",
        "percentageOff": null,
        "amountOff": 5.99
      }
    ]
  },
),
  StoreModel.fromJson(
    {
      "id": "2",
      "name": "Store A",
      "rating": 4.5,
      "reviews": [
        {
          "avatar": "https://businessfinder.me/wp-content/uploads/2021/06/44.jpg",
          "username": "User1",
          "storeId": "1",
          "productId": "1",
          "rating": 4,
          "isLiked": true,
          "review": "Great store!"
        },
        {
          "avatar": "avatar2.jpg",
          "username": "User2",
          "storeId": "1",
          "productId": "2",
          "rating": 5,
          "isLiked": false,
          "review": "Amazing products!"
        }
      ],
      "image": "https://businessfinder.me/wp-content/uploads/2021/06/44.jpg",
      "kmAway": 2.5,
      "address": "123 Main St",
      "contact": "123-456-7890",
      "activeHours": 8,
      "categories": [
        {
          "img": "https://businessfinder.me/wp-content/uploads/2021/06/44.jpg",
          "name": "Category A"
        },
        {
          "img": "https://businessfinder.me/wp-content/uploads/2021/06/44.jpg",
          "name": "Category B"
        }
      ],
      "products": [
        {
          "name": "Product A",
          "rating": "4.8",
          "reviews": [
            {
              "avatar": "avatar3.jpg",
              "username": "User3",
              "storeId": "1",
              "productId": "1",
              "rating": 5,
              "isLiked": true,
              "review": "Excellent product!"
            }
          ],
          "image": "https://businessfinder.me/wp-content/uploads/2021/06/44.jpg",
          "categoryId": "2",
          "offersId": {
            "id": "1",
            "name": "20% Off",
            "percentageOff": 20
          },
          "amount": 10.99,
          "rentalUnit": null,
          "quantity": 20,
          "variants": [
            {
              "productID": "1",
              "CategoryID": "1",
              "variantName": "Variant 1",
              "price": 9.99,
              "discount": 0
            },
            {
              "productID": "1",
              "CategoryID": "1",
              "variantName": "Variant 2",
              "price": 12.99,
              "discount": 0
            }
          ]
        },
        {
          "name": "Product B",
          "rating": "4.5",
          "reviews": [],
          "image": "https://businessfinder.me/wp-content/uploads/2021/06/44.jpg",
          "categoryId": "2",
          "offersId": null,
          "amount": 15.99,
          "rentalUnit": "day",
          "quantity": 10,
          "variants": [
            {
              "productID": "2",
              "CategoryID": "2",
              "variantName": "Variant 1",
              "price": 14.99,
              "discount": 0
            }
          ]
        }
      ],
      "offers": [
        {
          "id": "1",
          "name": "20% Off",
          "percentageOff": 20,
          "amountOff": null
        },
        {
          "id": "2",
          "name": "Free Shipping",
          "percentageOff": null,
          "amountOff": 5.99
        }
      ]
    },
  ),
];
