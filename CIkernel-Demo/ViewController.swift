//
//  ViewController.swift
//  CIkernel-Demo
//
//  Created by SOTSYS022 on 10/07/18.
//  Copyright © 2018 SOTSYS022. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    var counter:CGFloat = 1.0
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomFilter.registerFilters()
        var timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(setupFilter), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func setupFilter(){
        
        //1. Convert To CIImage
        let image = CIImage.init(image:#imageLiteral(resourceName: "root"))
        vhsLineEffect(image: image!)
    }
    
    func vhsLineEffect(image: CIImage){
        
        let filter = VCRDict()
        filter.inputImage = image
        counter += 10.0
        filter.inputTime = counter
        let context = CIContext.init(options: nil)
        // Comment and Uncomment cgImage Instance for color shading effect
        let cgImage = context.createCGImage((filter.outputImage)!, from: (filter.outputImage?.extent)!)
        let image2 = UIImage.init(cgImage: cgImage!)
        self.image.image = image2
    }


}

