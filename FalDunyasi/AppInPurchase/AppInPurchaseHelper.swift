//
//  AppInPurchaseHelper.swift
//  FalDunyasi
//
//  Created by Emir Kalkan on 13.03.2023.
//

import Foundation
import StoreKit


class AppInPurchaseHelper: NSObject {
    var inAppPurchaseList = [SKProduct]()
    var myProduct: SKProduct?
    let operationQueue = SKPaymentQueue.default()
    
    static let shared = AppInPurchaseHelper()
    
    func getProductsFromServer() {
        //let products: Set = [AppInPurchaseValues.removeAd.rawValue]
        let connectionRequest = SKProductsRequest(productIdentifiers: ["com.emir.FalDunyasi.reklamKaldir"])
        
        connectionRequest.delegate = self
        connectionRequest.start()
        
        operationQueue.add(self)
    }
    
    func buyProduct(prodId: AppInPurchaseValues) {
        /*guard let purchasedItem = inAppPurchaseList.filter({ $0.productIdentifier == prodId.rawValue }).first else {
            return
        }*/
        guard let myProduct = myProduct else {
            return
        }
        
        if SKPaymentQueue.canMakePayments() {
            let payment = SKPayment(product: myProduct)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
        }
       // let paymentTransaction = SKPayment(product: purchasedItem)
        //operationQueue.add(paymentTransaction)
    }
    
    func updateVal() {
        
    }
}

extension AppInPurchaseHelper: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        //self.inAppPurchaseList = response.products
        if let product = response.products.first {
            myProduct = product
            print(product.productIdentifier)
            print(product.price)
            print(product.localizedTitle)
            print(product.localizedDescription)
        }
        
        for item in response.products {
            print(item.localizedTitle)
        }
    }
}

extension AppInPurchaseHelper: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .deferred:
                print(transaction.payment.productIdentifier, "deferred")
            case .failed:
                print(transaction.payment.productIdentifier, "failed")
            case .purchased:
                UserDefaults.standard.set(true, forKey: "adsRemoved")
                print(transaction.payment.productIdentifier, "purchased")
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
            case .purchasing:
                print(transaction.payment.productIdentifier, "purchasing")
            case .restored:
                print(transaction.payment.productIdentifier, "restored")
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
            default:
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                break
            }
        }
    }
    
}
