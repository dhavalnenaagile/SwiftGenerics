//
//  BaseTableView.swift
//  Generics_TEST
//
//  Created by Dhaval Nena on 8/3/18.
//  Copyright © 2018 Dhaval Nena. All rights reserved.
//

import UIKit

class BaseTableView < T_Cell:BaseCell <U_Model>, U_Model > : UITableView, UITableViewDelegate, UITableViewDataSource {

    var arrDataSource = [U_Model]()
    var blockDidSelectRowAt:((IndexPath) -> Void)?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addIn(view:UIView) {

        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            leftAnchor.constraint(equalTo: view.readableContentGuide.leftAnchor),
            rightAnchor.constraint(equalTo: view.readableContentGuide.rightAnchor),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    func commonInit() {
        delegate = self
        dataSource = self
        backgroundColor = .gray
        layer.borderWidth = 2
        layer.borderColor = UIColor.red.cgColor
        register(T_Cell.self, forCellReuseIdentifier: T_Cell.cellIdentifier)
    }
    
    //MARK:- DATA SOURCE
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: T_Cell.cellIdentifier, for: indexPath) as! BaseCell<U_Model>
        cell.configure(item: arrDataSource[indexPath.row], indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        blockDidSelectRowAt?(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = arrDataSource[indexPath.row]
        return item.heightForCell
    }
}

class DogTableView: BaseTableView<DogCell, Dog> {
}

class StringTableView: BaseTableView<StringCell, String> {
}

class CountryTableView: BaseTableView<CountryCell, Country> {
}


//class HybridTableView: BaseTableView<BaseCell<Any>, Any> {

//class HybridTableView: BaseTableView<BaseCell<U_Model>, (U_Model : Protocol_HeightMeasurable & Protocol_ColorProvider & Protocol_DisplayNameProvider) > {


class HybridTableView: BaseTableView<BaseCell<ModelHybrid>, ModelHybrid > {

        // OVERRIDING DEFAULT BEHAVIOUR
        override func commonInit() {
            super.commonInit()
            
            register(DogCell.self, forCellReuseIdentifier: DogCell.cellIdentifier)
            register(StringCell.self, forCellReuseIdentifier: StringCell.cellIdentifier)
            register(CountryCell.self, forCellReuseIdentifier: CountryCell.cellIdentifier)
            register(HybridCell.self, forCellReuseIdentifier: HybridCell.cellIdentifier)
        }
        
//        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            
//            let hybridItem = arrDataSource[indexPath.row]

            
//            switch hybridItem {
//
//            case is Dog:
//                let cell = tableView.dequeueReusableCell(withIdentifier: DogCell.cellIdentifier) as! DogCell
//                cell.configure(item: hybridItem as! Dog, indexPath: indexPath)
//                return cell
//            case is String:
//                let cell = tableView.dequeueReusableCell(withIdentifier: StringCell.cellIdentifier) as! StringCell
//                cell.configure(item: hybridItem as! String, indexPath: indexPath)
//                return cell
//            case is Country:
//                let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.cellIdentifier) as! CountryCell
//                cell.configure(item: hybridItem as! Country, indexPath: indexPath)
//                return cell
//            default:
//                let cell = tableView.dequeueReusableCell(withIdentifier: BaseCell<Any>.cellIdentifier) as! BaseCell<Any>
//                cell.configure(item: hybridItem, indexPath: indexPath)
//                return cell
//            }
//        }
    
        
        //    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //
        //        let hybridItem = arrDataSource[indexPath.row]
        //
        //        switch hybridItem {
        //
        //        case is Dog:        return 70
        //        case is String:     return 140
        //        case is Country:    return 210
        //        default:            return 50
        //        }
        //    }
}






//class HybridTableView: BaseTableView<BaseCell<Any>, Any> {
//
//    // OVERRIDING DEFAULT BEHAVIOUR
//    override func commonInit() {
//        super.commonInit()
//
//        register(DogCell.self, forCellReuseIdentifier: DogCell.cellIdentifier)
//        register(StringCell.self, forCellReuseIdentifier: StringCell.cellIdentifier)
//        register(CountryCell.self, forCellReuseIdentifier: CountryCell.cellIdentifier)
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let hybridItem = arrDataSource[indexPath.row]
//
//        switch hybridItem {
//
//        case is Dog:
//            let cell = tableView.dequeueReusableCell(withIdentifier: DogCell.cellIdentifier) as! DogCell
//            cell.configure(item: hybridItem as! Dog, indexPath: indexPath)
//            return cell
//        case is String:
//            let cell = tableView.dequeueReusableCell(withIdentifier: StringCell.cellIdentifier) as! StringCell
//            cell.configure(item: hybridItem as! String, indexPath: indexPath)
//            return cell
//        case is Country:
//            let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.cellIdentifier) as! CountryCell
//            cell.configure(item: hybridItem as! Country, indexPath: indexPath)
//            return cell
//        default:
//            let cell = tableView.dequeueReusableCell(withIdentifier: BaseCell<Any>.cellIdentifier) as! BaseCell<Any>
//            cell.configure(item: hybridItem, indexPath: indexPath)
//            return cell
//        }
//    }
//
////    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////
////        let hybridItem = arrDataSource[indexPath.row]
////
////        switch hybridItem {
////
////        case is Dog:        return 70
////        case is String:     return 140
////        case is Country:    return 210
////        default:            return 50
////        }
////    }
//}
