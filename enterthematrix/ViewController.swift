//
//  ViewController.swift
//  enterthematrix
//
//  Created by Base on 11/15/14.
//  Copyright (c) 2014 Base. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var firstMatrix: [UITextView]!
    @IBOutlet var secondMatrix: [UITextView]!
    
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    
    let x = 3, y = 3;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.plusBtn.addTarget(self, action:"handleButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.minusBtn.addTarget(self, action:"handleButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)

        for textView in self.view.subviews as [UIView]{
            textView.alpha = 0.0;
        }
        
        startAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func startAnimation(){
        startMatrixAnimation(self.firstMatrix.count-1, matrixView: self.firstMatrix)
        startMatrixAnimation(self.secondMatrix.count-1, matrixView: self.secondMatrix)
    }
    
    func startMatrixAnimation(n:Int, matrixView : [UITextView]) {
        let origin : CGPoint = matrixView[n].frame.origin
        matrixView[n].frame.origin = CGPoint(x: origin.x - 100, y: origin.y - 100)
        
        UIView.animateWithDuration(0.2, animations: {
    
            matrixView[n].alpha = 1.0
            matrixView[n].frame.origin = origin
            
        }, completion: { finished in

            if(n>0){
                self.startMatrixAnimation(n-1, matrixView: matrixView)
            }else{
                self.startBounceAniamation(self.plusBtn)
                self.startBounceAniamation(self.minusBtn)
            }
            
        })
    }
    
    func startBounceAniamation(view : UIView){
        
        view.transform = CGAffineTransformMakeScale(0.4, 0.4)
        
        UIView.animateWithDuration(0.2, animations: {
            
            view.alpha = 1.0
            view.transform = CGAffineTransformMakeScale(1.4, 1.4)
            
            }, completion: { finished in
                
                UIView.animateWithDuration(0.2, animations: {
                    
                    view.transform = CGAffineTransformMakeScale(0.6, 0.6)
                    
                    }, completion: { finished in
                        
                        UIView.animateWithDuration(0.3, animations: {
                            
                            view.transform = CGAffineTransformMakeScale(1.2, 1.2)
                            
                            }, completion: { finished in
                                
                                UIView.animateWithDuration(0.3, animations: {
                                    
                                    view.transform = CGAffineTransformMakeScale(1.0, 1.0)
                                    
                                    }, completion: { finished in
                                    
                                        
                                })
                                
                        })
                        
                })
                
        })
        
    }
    
    func handleButtonAction(sender:UIButton!) {
        if sender == self.plusBtn {
            sum()
        }else if sender == self.minusBtn{
            subtract()
        }
    }
    
    func parseMatrix(textViewArray:[UITextView]) -> [Double]{
        var index  = 0;
        var values : [Double] = []
        
        for textView in textViewArray as [UITextView] {
            var tempString = (textView.text as NSString).doubleValue
            values.append(tempString)
            index += 1
        }
        
        return values
    }

    func sum() {
        let firstMatrix = Matrix(cols: x, rows: y, values: parseMatrix(self.firstMatrix))
        let secondMatrix = Matrix(cols: x, rows: y, values: parseMatrix(self.secondMatrix))
        let result : Matrix = firstMatrix.add(secondMatrix)
        
        showResult(result)
    }

    func subtract() {
        let firstMatrix = Matrix(cols: x, rows: y, values: parseMatrix(self.firstMatrix))
        let secondMatrix = Matrix(cols: x, rows: y, values: parseMatrix(self.secondMatrix))
        let result : Matrix = firstMatrix.subtract(secondMatrix)
        
        showResult(result)
    }
    
    func showResult(result:Matrix){
        let storyboard = UIStoryboard(name:"Main", bundle: nil);
        let resultVC = storyboard.instantiateViewControllerWithIdentifier("resultView") as ResultController;

        resultVC.matrix = result
        
        addChildViewController(resultVC)
        resultVC.view.frame = CGRectMake(0,0,600,600)
        resultVC.view.center = self.view.center
        resultVC.view.alpha = 0.0
        
        self.view.addSubview(resultVC.view)
        resultVC.view.layer.cornerRadius = 0.5
        
        startBounceAniamation(resultVC.view)
    }

}

