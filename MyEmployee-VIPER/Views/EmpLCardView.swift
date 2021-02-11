//
//  EmpLCardView.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 08/02/21.
//

import UIKit

class EmployeeListCardView: UIView {
    
    // MARK: View Properties
    
    lazy var borderView: UIView = {
        let applyBorder = UIView()
        return applyBorder
    }()
    
    lazy var reactSmileyImageView: UIImageView = {
        let reactImageView = UIImageView()
        reactImageView.contentMode = .scaleAspectFit
        return reactImageView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .appBlack()
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(with: .BOLD, of: .TITLE)
        return titleLabel
    }()

    lazy var websiteNameLabel: UILabel = {
        let websiteNameLabel = UILabel()
        websiteNameLabel.textColor = .appBlack()
        websiteNameLabel.textAlignment = .center
        websiteNameLabel.font = UIFont(with: .MEDIUM, of: .SUB_TITLE)
        return websiteNameLabel
    }()
    
    lazy var companyNameLabel: UILabel = {
        let companyNameLabel = UILabel()
        companyNameLabel.textColor = .appBlack()
        companyNameLabel.textAlignment = .center
        companyNameLabel.font = UIFont(with: .MEDIUM, of: .SUB_TITLE)
        return companyNameLabel
    }()
    
    lazy var favouriteButton: UIButton = {
        let starButton = UIButton()
        starButton.setTitleColor(.appWhite(), for: .normal)
        starButton.backgroundColor = UIColor(hex: APP_COLOR.THEME.rawValue)
        starButton.titleLabel?.font = UIFont(with: .MEDIUM, of: .SUB_TITLE)
        return starButton
    }()
    
    lazy var seperationView: UIView = {
        let seperationView = UIView()
        seperationView.backgroundColor = .gray
        return seperationView
    }()
    
    // MARK: Data Properties
    var employee : Employee? {
        didSet {
            guard let employee = employee else {
                return
            }
            titleLabel.text = employee.name
            companyNameLabel.text = employee.company?.name
            websiteNameLabel.text = employee.website
            favouriteButton.setTitle(employee.isFavourite ? FavButtonTitle.favourite : FavButtonTitle.not_a_Favourite, for: .normal)
            reactSmileyImageView.image = employee.isFavourite ? UIImage(named: IMAGE_NAME.SMILING.rawValue) : UIImage(named: IMAGE_NAME.SURPRISED.rawValue)
        }
    }
    
    // MARK: Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareView()
    }
    
    // MARK: Private Custom Methods
    private func prepareView() {
        
        addSubview(borderView)
        borderView.pinEdgesEquallyToSuperview(atrributes: [.top, .bottom, .leading, .trailing], constant: Constants.defaultPadding)
        
        addSubview(reactSmileyImageView)
        reactSmileyImageView.pinTo(atrribute: .top, toView: borderView, toAttribute: .top, constant: Constants.defaultSpacing)
        reactSmileyImageView.pin(height: Constants.defaultImageHeight, width: Constants.defaultImageHeight)
        reactSmileyImageView.pinToSuperview(atrribute: .centerXWithinMargins)

        addSubview(titleLabel)
        titleLabel.pinTo(atrribute: .top, toView: reactSmileyImageView, toAttribute: .bottom, constant: Constants.defaultPadding/2)
        titleLabel.pinEdgesEquallyToSuperview(atrributes: [.leading, .trailing], constant: Constants.defaultSuperViewSpacing)
        titleLabel.pinHeight(Constants.defaultLabelHeight)
        
        addSubview(companyNameLabel)
        companyNameLabel.pinTo(atrribute: .top, toView: titleLabel, toAttribute: .bottom, constant: Constants.defaultSpacing)
        companyNameLabel.pinEdgesEquallyToSuperview(atrributes: [.leading, .trailing], constant: Constants.defaultPadding/2)
        companyNameLabel.pinHeight(Constants.subTitleLabelHeight)
        
        addSubview(websiteNameLabel)
        websiteNameLabel.pinTo(atrribute: .top, toView: companyNameLabel, toAttribute: .bottom, constant: Constants.defaultSpacing)
        websiteNameLabel.pinEdgesEquallyToSuperview(atrributes: [.leading, .trailing], constant: Constants.defaultPadding/2)
        websiteNameLabel.pinHeight(Constants.subTitleLabelHeight)

        addSubview(favouriteButton)
        favouriteButton.pinTo(atrribute: .top, toView: websiteNameLabel, toAttribute: .bottom, constant: Constants.defaultPadding/2)
        favouriteButton.pinEdgesEquallyToSuperview(atrributes: [.leading, .trailing], constant: Constants.defaultPadding*10)
        favouriteButton.pinHeight(Constants.defaultButtonHeight)
        favouriteButton.giveCorner(radius: Constants.defaultRadius)
        
        addSubview(seperationView)
        seperationView.pinTo(atrribute: .top, toView: favouriteButton, toAttribute: .bottom, constant: Constants.defaultPadding + 8)
        seperationView.pinEdgesEquallyToSuperview(atrributes: [.leading, .trailing], constant: Constants.defaultPadding*2*2)
        seperationView.pinHeight(Constants.defaultSpacing)
        
    }
    
}
