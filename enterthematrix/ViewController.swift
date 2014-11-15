//
//  ViewController.swift
//  enterthematrix
//
//  Created by Base on 11/15/14.
//  Copyright (c) 2014 Base. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var matrixHeaders: [UILabel]!
    @IBOutlet var firstMatrix: [UITextView]!
    @IBOutlet var secondMatrix: [UITextView]!
    
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var multiplyBtn: UIButton!

    var firstMatrixArray : [Double] = []
    var secondMatrixArray : [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.plusBtn.addTarget(self, action:"parseMatrix", forControlEvents: UIControlEvents.TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    func parseMatrix() {
        var index  = 0;
        for textView in self.firstMatrix as [UITextView] {
            var tempString = (textView.text as NSString).doubleValue
            self.firstMatrixArray.append(tempString)
            index += 1
        }
        
        for textView in self.secondMatrix as [UITextView] {
            var tempString = (textView.text as NSString).doubleValue
            self.secondMatrixArray.append(tempString)
            index += 1
        }
        
        println("Our first matrix is: \(self.firstMatrixArray) \nOur second matrix is: \(self.secondMatrixArray)")
    }
    
}

