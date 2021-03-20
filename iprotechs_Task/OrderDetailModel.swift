//
//  OrderDetailModel.swift
//  iprotechs_Task
//
//  Created by SANKAR on 20/03/21.
//

import Foundation

struct OrderDetail: Codable {
    let customerPhone, orderTotal: String?
    var order: [Order]?
    
    enum CodingKeys: String, CodingKey {
        case customerPhone = "CustomerPhone"
        case orderTotal = "OrderTotal"
        case order
    }
    // MARK: - Order
    struct Order: Codable {
        let orderNumber, orderDueDate, customerBuyerName, customerAddress: String?
        let customerPhone, orderTotal: String?
        
        enum CodingKeys: String, CodingKey {
            case orderNumber = "OrderNumber"
            case orderDueDate = "OrderDueDate"
            case customerBuyerName = "CustomerBuyerName"
            case customerAddress = "CustomerAddress"
            case customerPhone = "CustomerPhone"
            case orderTotal = "OrderTotal"
        }
    }
    
}
