//
//  EmpDetailVC.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 08/02/21.
//

import UIKit

final class EmpDetailVC: UIViewController {
    
    @IBOutlet weak var lblNameText: UILabel!
    @IBOutlet weak var lblUserNameText: UILabel!
    @IBOutlet weak var lblAddressText: UILabel!
    @IBOutlet weak var lblCompanyText: UILabel!
    @IBOutlet weak var lblPhoneText: UILabel!
    @IBOutlet weak var lblWebsiteText: UILabel!
    @IBOutlet weak var btnStarMarked: UIButton!
    
    var presenter: EmployeeDetailViewOutput?
    
    //MARK: viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.fetchEmployeeDetails()
    }
    
    func setupViews(){
        btnStarMarked.setTitleColor(.appWhite(), for: .normal)
        btnStarMarked.giveCorner(radius: Constants.defaultRadius)
        
        lblNameText.giveShadow(radius: Constants.defaultRadius)
        lblUserNameText.giveShadow(radius: Constants.defaultRadius)
        lblAddressText.giveShadow(radius: Constants.defaultRadius)
        lblCompanyText.giveShadow(radius: Constants.defaultRadius)
        lblPhoneText.giveShadow(radius: Constants.defaultRadius)
        lblWebsiteText.giveShadow(radius: Constants.defaultRadius)
        
    }
    
    //MARK: buttonFavMarked

    @IBAction func btnStarMarked(_ sender: UIButton) {
        presenter?.userTappedOnFavouriteButton()
    }
    
    deinit {
        print("EmployeeDetailView removed")
    }
}

//MARK: EmployeeDetailViewInputProtocol

extension EmpDetailVC: EmployeeDetailViewInputProtocol {
    
    func showDetails(of employee: Employee) {
        lblNameText.text = employee.name
        lblUserNameText.text = employee.username
        lblAddressText.text = employee.address?.street ?? ""
        lblCompanyText.text = employee.company?.name
        lblPhoneText.text = employee.phone
        lblWebsiteText.text = employee.website
    }
    
    func updateFavouriteButton(with image: UIImage) {
        btnStarMarked.setImage(image, for: .normal)
    }
        
}
