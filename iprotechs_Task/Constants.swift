//
//  Constants.swift
//  iprotechs_Task
//
//  Created by SANKAR on 19/03/21.
//

import Foundation
import UIKit
//*********************************Constants**********************//
let userLoginKey = "loginData"
let userAlertMessageForFields = "Please enter all fields *"


//*********************************Constants**********************//



extension UIViewController {
    func showAlertToUser(viewcontroller: UIViewController,message: String){
        let alert = UIAlertController(title: "iprotechs_Task Alert", message:message , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
        }))
        viewcontroller.present(alert, animated: true, completion: nil)
    }
    
    func readLocalizationFile() -> OrderDetail?{
        var orderDetail: OrderDetail?
        if let path = Bundle.main.path(forResource: "OrderDetail", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                do {
                    let decoder = JSONDecoder()
                    if let jsonPetitions = try? decoder.decode(OrderDetail.self, from: data) {
                        orderDetail = jsonPetitions
                    }
                }
            } catch let error {
                print(error.localizedDescription)
            }
            return orderDetail
        }else{
            return orderDetail
        }
    }
    
}



