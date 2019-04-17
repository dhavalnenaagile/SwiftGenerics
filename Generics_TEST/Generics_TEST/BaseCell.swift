//
//  BaseCell.swift
//  Generics_TEST
//
//  Created by Dhaval Nena on 8/7/18.
//  Copyright © 2018 Dhaval Nena. All rights reserved.
//

import UIKit

//MARK:- ********** CELL PROTOCOLS **********

protocol Protocol_HeightMeasurable {
    var heightForCell:CGFloat { get }
}

protocol Protocol_ColorProvider {
    var colorForCell:UIColor { get }
}

protocol Protocol_DisplayNameProvider {
    var displayName:String { get }
}

protocol Protocol_CellConfigurable {
    associatedtype U
    static var cellIdentifier:String { get }
    func configure(item:U,indexPath:IndexPath)
}

//MARK:- ********** BASE CELL **********

class BaseCell<U_Model:Protocol_HeightMeasurable & Protocol_ColorProvider & Protocol_DisplayNameProvider> : UITableViewCell, Protocol_CellConfigurable {
    
    var item:U_Model!
    
    static var cellIdentifier: String {
        return String(describing: self)
    }
    
    func configure(item:U_Model,indexPath: IndexPath) {
        textLabel?.text = "Row: \(indexPath.row), \tClass: \(U.self)  \tData: \(item.displayName) OVERRIDE THIS !!"
        backgroundColor = item.colorForCell.withAlphaComponent(0.3)
    }

    //MARK:- INIT
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func commonInit(){
        selectionStyle = .none
        textLabel?.numberOfLines = 0
    }
}

//MARK:- ********** DIFFERENT CELL VARIANTS **********
class StringCell: BaseCell<String> {
    
//    override func configure(item: String, indexPath: IndexPath) {
//        super.configure(item: item, indexPath: indexPath)
//        textLabel?.text = "Row: \(indexPath.row), \tClass: \(U.self), \tData: \(item)"
//    }
}

class DogCell: BaseCell<Dog> {
    
//    override func configure(item: Dog, indexPath: IndexPath) {
//        super.configure(item: item, indexPath: indexPath)
//        textLabel?.text = "Row: \(indexPath.row), \tClass: \(U.self), \tData: \(item.name)"
//    }
}

class CountryCell: BaseCell<Country> {
    
//    override func configure(item: Country, indexPath: IndexPath) {
//        super.configure(item: item, indexPath: indexPath)
//        textLabel?.text = "Row: \(indexPath.row), \tClass: \(U.self), \tData: \(item.name)"
//    }
}

class HybridCell: BaseCell<ModelHybrid> {
    
}
