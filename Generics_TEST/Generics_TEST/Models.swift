//
//  Models.swift
//  Generics_TEST
//
//  Created by Dhaval Nena on 8/7/18.
//  Copyright © 2018 Dhaval Nena. All rights reserved.
//

import UIKit


struct Dog : Protocol_HeightMeasurable, Protocol_ColorProvider, Protocol_DisplayNameProvider {
    var displayName: String { return name }
    var colorForCell: UIColor { return .red }
    var heightForCell: CGFloat { return 120 }
    let name : String
}

struct Country : Protocol_HeightMeasurable, Protocol_ColorProvider, Protocol_DisplayNameProvider {
    var displayName: String { return name }
    var colorForCell: UIColor { return .green }
    var heightForCell: CGFloat { return 150 }
    let name : String
}

extension String : Protocol_HeightMeasurable, Protocol_ColorProvider, Protocol_DisplayNameProvider {
    var displayName: String { return self }
    var colorForCell: UIColor { return .blue }
    var heightForCell: CGFloat { return 80 }
}

struct ModelHybrid: Protocol_DisplayNameProvider, Protocol_ColorProvider, Protocol_HeightMeasurable {
    
    var displayName: String = ""
    var colorForCell: UIColor = .red
    var heightForCell: CGFloat = 0.0
    
    init(dog:Dog) {
        self.displayName = dog.displayName
        self.colorForCell = dog.colorForCell
        self.heightForCell = dog.heightForCell
    }
    init(country:Country) {
        self.displayName = country.displayName
        self.colorForCell = country.colorForCell
        self.heightForCell = country.heightForCell
    }
    init(str:String) {
        self.displayName = str
        self.colorForCell = str.colorForCell
        self.heightForCell = str.heightForCell
    }
}
