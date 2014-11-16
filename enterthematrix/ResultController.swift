//
//  ResultController.swift
//  enterthematrix
//
//  Created by Base on 11/16/14.
//  Copyright (c) 2014 Base. All rights reserved.
//

import UIKit

class ResultController: UIViewController {

    @IBOutlet weak var resultMatrix: UITextView!
    
    let matrix : Matrix

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showResult(){
        println(self.matrix.values)
    }

}
