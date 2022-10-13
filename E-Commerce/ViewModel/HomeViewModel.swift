//
//  HomeViewModel.swift
//  E-Commerce
//
//  Created by Nguyen Quang Ha on 12/10/2022.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var productType: ProductType = .Wearable
    
    //Product
    @Published var products: [Product] = [
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 6: Red", price: "$359", productImage: "AppleWatch6"),
        Product(type: .Wearable, title: "Samsung Watch", subtitle: "Gear: Black", price: "$180", productImage: "SamsungWatch"),
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 4: Black", price: "$250", productImage: "AppleWatch4"),
        Product(type: .Phones, title: "iPhone 13", subtitle: "A15 - Pink", price: "$699", productImage: "iPhone13"),
        Product(type: .Phones, title: "iPhone 12", subtitle: "A14 - Blue", price: "$599", productImage: "iPhone12"),
        Product(type: .Phones, title: "iPhone 11", subtitle: "A13 - Purple", price: "$499", productImage: "iPhone11"),
        Product(type: .Phones, title: "iPhoneSE 2", subtitle: "A13 - White", price: "$399", productImage: "iPhoneSE"),
        Product(type: .Laptops, title: "Macbook Air", subtitle: "M1 - Gold", price: "$999", productImage: "MacBookAir"),
        Product(type: .Laptops, title: "Macbook Pro", subtitle: "M1 - Space Grey", price: "$1299", productImage: "MacBookPro"),
        Product(type: .Laptops, title: "iMac", subtitle: "M1 - Purple", price: "$1599", productImage: "iMac"),
        Product(type: .Tablets, title: "iPad Pro", subtitle: "M1 - Silver", price: "$999", productImage: "iPadPro"),
        Product(type: .Tablets, title: "iPad Air 4", subtitle: "A14 - Pink", price: "$699", productImage: "iPadAir"),
        Product(type: .Tablets, title: "iPad Mini", subtitle: "A15 - Grey", price: "$599", productImage: "iPadMini"),
    ]
    
    //filtered products
    @Published var filteredProduct: [Product] = []
    
    //more products
    @Published var showMoreProductsOnType: Bool = false
    
    //search data
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    
    init() {
        filterProductByType()
    }
    
    func filterProductByType() {
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
                .lazy
                .filter{ product in
                    return product.type == self.productType
                }
                .prefix(4)
            DispatchQueue.main.async {
                self.filteredProduct = results.compactMap({product in
                    return product
                })
            }
        }
    }
}