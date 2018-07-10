//
//  CustomFilter.swift
//  CIImage-Demo
//
//  Created by SOTSYS027 on 26/06/18.
//  Copyright © 2018 SOTSYS027. All rights reserved.
//

import Foundation
import CoreImage

let CategoryCustomFilters = "Custom Filters"

class CustomFilter: NSObject, CIFilterConstructor {
    func filter(withName name: String) -> CIFilter? {
        switch name {
        case "VCRDist":
            return VCRDict()
        default:
            return nil
        }
    }
    
    static func registerFilters(){
        CIFilter.registerName("VCRDist", constructor: CustomFilter(), classAttributes: [
            kCIAttributeFilterCategories: [CategoryCustomFilters]
            ])
    }
}
