//
//  OrderDetailsPopupVC.swift
//  iprotechs_Task
//
//  Created by SANKAR on 20/03/21.
//

import UIKit

protocol UpdateOrderDetailsDelegate {
    func updateOrderDetails(indexPath: IndexPath, product: OrderDetail.Order?)
    func addNewOrderDetails(product: OrderDetail.Order?)
}

class OrderDetailsPopupVC: UIViewController {

    @IBOutlet weak var popupBGView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var orderDateTextField: UITextField!
    
    @IBOutlet weak var adrressTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var orderNumberTextField: UITextField!
    
    var productDetails : OrderDetail.Order?
    var selectedIndex: IndexPath?
    var orderDelegate:UpdateOrderDetailsDelegate?
    var isNewOrder = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popupBGView.layer.cornerRadius = 10
        self.cancelButton.layer.cornerRadius = 5
        self.saveButton.layer.cornerRadius = 5
        self.bgImageView.layer.cornerRadius = 10
        if let product = productDetails {
            self.isNewOrder = true
            nameTextField.text = product.customerBuyerName ?? ""
            orderDateTextField.text = product.orderDueDate ?? ""
            adrressTextField.text = product.customerAddress ?? ""
            phoneNumberTextField.text = product.customerPhone ?? ""
            orderNumberTextField.text = product.orderNumber ?? ""
        }
       
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        if nameTextField.text?.isEmpty == true && nameTextField.text == "" || orderDateTextField.text?.isEmpty == true && orderDateTextField.text == "" || adrressTextField.text?.isEmpty == true && adrressTextField.text == "" || phoneNumberTextField.text?.isEmpty == true && phoneNumberTextField.text == "" || orderNumberTextField.text?.isEmpty == true && orderNumberTextField.text == "" {
            showAlertToUser(viewcontroller: self, message: userAlertMessageForFields)
            return
        }
        let item = OrderDetail.Order(orderNumber: orderNumberTextField.text, orderDueDate: orderDateTextField.text, customerBuyerName: nameTextField.text, customerAddress: adrressTextField.text, customerPhone: phoneNumberTextField.text, orderTotal: "500")
        if self.isNewOrder {
            self.orderDelegate?.addNewOrderDetails(product: item)
        }else{
            self.orderDelegate?.updateOrderDetails(indexPath: selectedIndex ?? IndexPath(row: 0, section: 0), product: item)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    

}
extension OrderDetailsPopupVC{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        self.view.endEditing(true)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.view.endEditing(true)
    }
}
