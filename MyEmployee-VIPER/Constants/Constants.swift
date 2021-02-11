//
//  Constants.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 08/02/21.
//

import Foundation
import UIKit

enum Strings {
    static let empListDBTitle = "Employee List"
    
    static let cancel = "Cancel"
    static let ok = "Ok"
    static let retry = "Retry"
    static let error = "Error"
    static let close = "close"
    
}
// MARK: Application Font Size

enum APP_FONT_SIZE: Float {
    case TITLE      = 20
    case DEFAULT    = 17
    case SUB_TITLE  = 14
    case SMALL      = 12
    case NANO       = 10
    case HEADER1    = 32
    case HEADER2    = 26
    case HEADER3    = 22
}
// MARK: Application Font Style

enum APP_FONT_STYLE: String {
    case LIGHT      = "HelveticaNeue-Light"
    case REGULAR    = "HelveticaNeue"
    case MEDIUM     = "HelveticaNeue-Medium"
    case BOLD       = "HelveticaNeue-Bold"
}

// MARK: Application Color

enum APP_COLOR: String {
    case SUB_THEME = "70c295"
    case THEME = "3ca5dd"
}

// MARK: Application Constant

enum Constants {
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    static let defaultSpacing: CGFloat = 1
    static let defaultSuperViewSpacing: CGFloat = 5
    static let defaultPadding: CGFloat = 8
    static let numberOfColumns: CGFloat = 2
    static let defaultRadius: CGFloat = 10
    static let defaultPageNum: Int = 0
    static let defaultTotalCount: Int = 0
    static let defaultPageSize: Int = 20
    static let defaultLabelHeight: CGFloat = 25.0
    static let subTitleLabelHeight: CGFloat = 20.0
    static let defaultButtonHeight: CGFloat = 35.0
    static let defaultImageHeight: CGFloat = 60.0
    static let employeeListHeight: CGFloat = 200.0

}
// MARK: Application View State

public enum ViewState: Equatable {
    case none
    case loading
    case error(String)
    case content
}

// MARK: Favourtie Image selection

enum IMAGE_NAME: String {
    case FAVOURITE = "fav-filled"
    case NOT_A_FAVOURITE = "fav"
    case SMILING = "smiling"
    case SURPRISED = "surprised"
    
}

// MARK: Favourite button title

enum FavButtonTitle {
    static let favourite = "Favourite"
    static let not_a_Favourite = "Not a Favourite"
 
}
