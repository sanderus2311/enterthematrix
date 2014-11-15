//
//  thematrix.swift
//  enterthematrix
//
//  Created by Base on 11/15/14.
//  Copyright (c) 2014 Base. All rights reserved.
//

import UIKit

class Matrix: NSObject {
    
    let firstMatix : [Double] = []
    let secondMatrix : [Double] = []
    let height : Int = 3
    let width : Int = 3
    
    init(tempFirstMatrix : [Double], tempSecondMatrix : [Double]){
        self.firstMatix = tempFirstMatrix
        self.secondMatrix = tempSecondMatrix
    }
    
    func sumMatrix() -> [Double] {
        var result : [Double] = []
        
        for i in 0..<self.firstMatix.count {
            result.append(self.firstMatix[i] + self.secondMatrix[i]);
        }
        
        return result
    }
    
    func subtractMatix() -> [Double] {
        var result : [Double] = []
        
        for i in 0..<self.firstMatix.count {
            result.append(self.firstMatix[i] - self.secondMatrix[i]);
        }
        
        return result
    }

    func multiplyMatix() -> [Double] {
        var result : [Double] = []
        var temp : Double = 0.0
        
        for index in 0..<self.width * self.height{

            temp = 0.0
            
            for i in 0..<self.width {
                for x in 0..<self.height{
                    for y in 0..<self.height{
                        temp += self.firstMatix[x + y*self.width] * self.secondMatrix[y + x*self.height]
                    }
                }
            }
            
            result.append(temp)
        }
        
        return result
    }
}

/*
class Matrix {
let rawValues: [Double];
let i: Int;
let j: Int;

init(i: Int, j: Int, v:[Double]) {
self.rawValues = v;
self.i = i;
self.j = j;
}

func minus() -> Matrix {
let newValues = rawValues.map({
(v: Double) -> Double in
return -v
});
return Matrix(i:i,j:j, v:newValues);
}
}

prefix func - (a: Matrix) -> Matrix {
return a.minus();
}
*/
