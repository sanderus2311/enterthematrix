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
    var resultArray : [Double] = []
    var matrixModel : Matrix?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.plusBtn.addTarget(self, action:"handleButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.minusBtn.addTarget(self, action:"handleButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.multiplyBtn.addTarget(self, action:"handleButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        startAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func startAnimation() {
        
        
        UIView.animateWithDuration(0.2, animations: {
            
        }, completion: {
        
            
            
        })
    }
    
    func handleButtonAction(sender:UIButton!) {
        parseMatrix()
        
        if sender == self.plusBtn {
            sum()
        }else if sender == self.minusBtn{
            subtract()
        }else if sender == self.multiplyBtn{
            multiply()
        }
    }
    
    func parseMatrix(){
        var index  = 0;
        self.firstMatrixArray = []
        self.secondMatrixArray = []
        
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

    func sum() {
        matrixModel = Matrix(tempFirstMatrix: firstMatrixArray, tempSecondMatrix: secondMatrixArray)
        var result = matrixModel?.sumMatrix()
        
        println("Sum of our matrixies is equal to: \(result)")
    }

    func subtract() {
        matrixModel = Matrix(tempFirstMatrix: firstMatrixArray, tempSecondMatrix: secondMatrixArray)
        var result = matrixModel?.subtractMatix()
        
        println("Subtract of our matrixies is equal to: \(result)")
    }
    
    func multiply(){
        matrixModel = Matrix(tempFirstMatrix: firstMatrixArray, tempSecondMatrix: secondMatrixArray)
        var result = matrixModel?.multiplyMatix()
        
        println("Multiply our matrixies is equal to: \(result)")
    }
}

