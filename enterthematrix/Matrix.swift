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
    let height : Int = 2
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
