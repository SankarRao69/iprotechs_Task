//
//  OrderViewController.swift
//  iprotechs_Task
//
//  Created by SANKAR on 19/03/21.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var orderDetailsTableView: UITableView!
    @IBOutlet weak var totalOderValueLabel: UILabel!
    @IBOutlet weak var customerNameLabel: UILabel!
    var orderDetailData: OrderDetail?
    var totalValue:CGFloat = 0.0
    @IBOutlet weak var placeOrderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewWillAppear(true)
        self.placeOrderButton.layer.cornerRadius = 5
        self.callOrderDetails()
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        Utilities.shared.removeAllUserDefaultsData()
        let loginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginViewController") as? LoginViewController
        loginVC?.modalPresentationStyle = .fullScreen
        self.present(loginVC ?? UIViewController(), animated: true, completion: nil)
    }
    func callOrderDetails(){
        self.orderDetailData = readLocalizationFile()
        if let totalOders = self.orderDetailData?.order {
            for eachOrder in totalOders {
                let amount = CGFloat("\(eachOrder.orderTotal ?? "0")".floatValue)
                totalValue = totalValue + amount
            }
        }
        self.customerNameLabel.text = "Name : Sankar Rao"
        self.totalOderValueLabel.text = "Total Order Number : RS \(totalValue)  /-"
        self.reloadTableView()
    }

    func reloadTableView(){
        self.orderDetailsTableView.delegate = self
        self.orderDetailsTableView.dataSource = self
        self.orderDetailsTableView.reloadData()
    }
    
    @IBAction func newOrderButtonTapped(_ sender: UIBarButtonItem) {
        let ordersDetailsVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "OrderDetailsPopupVC") as? OrderDetailsPopupVC
        ordersDetailsVC?.modalPresentationStyle = .overCurrentContext
        ordersDetailsVC?.modalTransitionStyle = .crossDissolve
        ordersDetailsVC?.orderDelegate = self
        self.present(ordersDetailsVC ?? UIViewController(), animated: true, completion: nil)
    }
    
    @IBAction func placeOrderDetailsButtonTapped(_ sender: UIButton) {
    }
    
}
extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}
extension OrderViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ordersDetailsVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "OrderDetailsPopupVC") as? OrderDetailsPopupVC
        ordersDetailsVC?.modalPresentationStyle = .overCurrentContext
        ordersDetailsVC?.modalTransitionStyle = .crossDissolve
        ordersDetailsVC?.selectedIndex = indexPath
        ordersDetailsVC?.orderDelegate = self
        ordersDetailsVC?.productDetails = orderDetailData?.order?[indexPath.row]
        self.present(ordersDetailsVC ?? UIViewController(), animated: true, completion: nil)
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            self.showAlertToUser(tableView, forRowAt: indexPath)
        }
    }
    
    func showAlertToUser(_ tableView: UITableView, forRowAt indexPath: IndexPath){
        let alert = UIAlertController(title: "iprotechs_Task Alert", message: " Are you sure want delete", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (_) in
        }))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.orderDetailData?.order?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
extension OrderViewController: UpdateOrderDetailsDelegate {
    func addNewOrderDetails(product: OrderDetail.Order?) {
        if let newProduct = product {
            self.orderDetailData?.order?.append(newProduct)
            self.reloadTableView()
        }
    }
    
    func updateOrderDetails(indexPath: IndexPath, product: OrderDetail.Order?) {
        if let updateProduct = product {
            self.orderDetailData?.order?[indexPath.row] = updateProduct
            self.reloadTableView()
        }
    }
    
    
}
extension OrderViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderDetailData?.order?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.orderDetailsTableView.register(UINib(nibName: "OrdersTableViewCell", bundle: nil), forCellReuseIdentifier: "OrdersTableViewCell")
        guard let orderCell = self.orderDetailsTableView.dequeueReusableCell(withIdentifier: "OrdersTableViewCell") as? OrdersTableViewCell else {
            return UITableViewCell()
        }
        orderCell.nameLabel.text = orderDetailData?.order?[indexPath.row].customerBuyerName ?? ""
        orderCell.OrderNumberLabel.text = orderDetailData?.order?[indexPath.row].orderNumber ?? ""
        orderCell.OrderDueDateLabel.text = orderDetailData?.order?[indexPath.row].orderDueDate ?? ""
        orderCell.addressLabel.text = orderDetailData?.order?[indexPath.row].customerAddress ?? ""
        orderCell.buyerNameLabel.text = orderDetailData?.order?[indexPath.row].customerPhone ?? ""
        orderCell.phoneLabel.text = "\(orderDetailData?.order?[indexPath.row].orderTotal ?? "") RS /-"
        let randomNumber = Int.random(in: 1..<9)
        orderCell.orderImageView.image = UIImage(named: "\(randomNumber)")
        return orderCell
    }
    
}

