//
//  ViewController.swift
//  Generics_TEST
//
//  Created by Dhaval Nena on 8/3/18.
//  Copyright © 2018 Dhaval Nena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- OUTLETS
    @IBOutlet private weak var btn: UIButton!

    private let tableViewDog = DogTableView()
    private let tableViewString = StringTableView()
    private let tableViewCountry = CountryTableView()
    
    private let tableViewHybrid = HybridTableView()
    
    
    //MARK:- VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doSetupUIForDog()
        doSetupUIForString()
        doSetupUIForCountry()
        doSetupUIForHybrid()
    }
    
    //MARK:- UI SETUP
    private func doSetupUIForDog(){
        tableViewDog.addIn(view: view)
        tableViewDog.arrDataSource = [Dog(name: "Dog 1"),Dog(name: "Dog 2")]
        tableViewDog.reloadData()
        tableViewDog.blockDidSelectRowAt = { [unowned selff = self] indexPath in
            print("DID SELECT ROW : \(indexPath.row), VALUE : \(selff.tableViewDog.arrDataSource[indexPath.row].name)")
        }
    }

    private func doSetupUIForCountry(){
        tableViewCountry.addIn(view: view)
        tableViewCountry.arrDataSource = [Country(name: "India"),Country(name: "Nepal")]
        tableViewCountry.reloadData()
        tableViewCountry.blockDidSelectRowAt = { [unowned selff = self] indexPath in
            print("DID SELECT ROW : \(indexPath.row), VALUE : \(selff.tableViewCountry.arrDataSource[indexPath.row].name)")
        }
    }

    private func doSetupUIForString(){
        tableViewString.addIn(view: view)
        tableViewString.arrDataSource = ["First","Second"]
        tableViewString.reloadData()
        tableViewString.blockDidSelectRowAt = { [unowned selff = self] indexPath in
            print("DID SELECT ROW : \(indexPath.row), VALUE : \(selff.tableViewString.arrDataSource[indexPath.row])")
        }
    }

    
    private func doSetupUIForHybrid(){
        tableViewHybrid.addIn(view: view)
        tableViewHybrid.arrDataSource = [ModelHybrid(str: "First"), ModelHybrid(str: "Second"), ModelHybrid(dog: Dog(name: "Dog1"))]
        tableViewHybrid.reloadData()
        tableViewHybrid.blockDidSelectRowAt = { [unowned selff = self] indexPath in
            print("DID SELECT ROW : \(indexPath.row), VALUE : \(selff.tableViewHybrid.arrDataSource[indexPath.row])")
        }
    }
    
    
    
//    private func doSetupUIHybrid(){
//        tableViewHybrid.addIn(view: view)
//
//        tableViewHybrid.arrDataSource = [Dog(name: "Dog1"),
//                                   "String1",
//                                   Country(name: "India"),
//                                   Dog(name: "Dog2"),
//                                   "String2",
//                                   Country(name: "Nepal")]
//        tableViewHybrid.reloadData()
//        tableViewHybrid.blockDidSelectRowAt = { [unowned selff = self] indexPath in
//
//            var itemToPrint = ""
//            let hybridItem = selff.tableViewHybrid.arrDataSource[indexPath.row]
//            switch hybridItem {
//            case is Dog:        itemToPrint = (hybridItem as! Dog).name
//            case is Country:    itemToPrint = (hybridItem as! Country).name
//            case is String:     itemToPrint = (hybridItem as! String)
//            default:    break
//            }
//            print("DID SELECT ROW : \(indexPath.row), VALUE : \(itemToPrint)")
//        }
//    }
    
}


