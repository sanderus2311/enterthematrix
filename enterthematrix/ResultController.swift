//
//  ResultController.swift
//  enterthematrix
//
//  Created by Base on 11/16/14.
//  Copyright (c) 2014 Base. All rights reserved.
//

import UIKit

class ResultController: UIViewController {
    
    @IBOutlet var resultMatrix: [UITextView]!

    
    var matrix : Matrix!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showResult()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showResult(){
    
        for var index = 0; index < self.resultMatrix.count; ++index {
            
            var tempString : String = String(format:"%.f", matrix.values[index])
            self.resultMatrix[index].text = tempString
        
        }
    
    }
    
    @IBAction func dimissView(sender: AnyObject) {
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
}
