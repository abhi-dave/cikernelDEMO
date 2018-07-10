//
//  VCRDist.swift
//  CIImage-Demo
//
//  Created by SOTSYS027 on 03/07/18.
//  Copyright © 2018 SOTSYS027. All rights reserved.
//

import CoreImage


class VCRDict: CIFilter {
    
    @objc var inputImage: CIImage?
    @objc var inputTime: CGFloat = 15.0
    
    override var outputImage: CIImage?
    {
        let vcrkernel: CIColorKernel =
        {
            let shaderPath = Bundle.main.path(forResource: "vhs2", ofType: "cikernel")
            
            guard let path = shaderPath,
                let code = try? String(contentsOfFile: path),
                let kernel = CIColorKernel(source: code) else
            {
                fatalError("Unable to build VCR shader")
            }
            
            return kernel
        }()
        
        
        if let inputCIImage = inputImage
        {   
            
            let arguments = [inputCIImage, inputTime] as [Any]
            let extent = inputCIImage.extent
            
            return vcrkernel.apply(extent: extent, arguments: arguments)
        }
        return nil
    }
    
}
