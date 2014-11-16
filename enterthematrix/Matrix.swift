//
//  thematrix.swift
//  enterthematrix
//
//  Created by Base on 11/15/14.
//  Copyright (c) 2014 Base. All rights reserved.
//

import UIKit

class Matrix {
    let values: [Double]
    let rows: Int
    let cols: Int
    
    init(cols:Int, rows: Int, values : [Double]){
        self.cols = cols
        self.rows = rows
        self.values = values
    }
    
    func add(other: Matrix) -> Matrix {
        var result : [Double] = []
        let count = self.values.count
        for i in 0..<count {
            result.append(self.values[i] + other.values[i]);
        }
        
        return Matrix(cols:cols, rows:rows, values:result);
    }
    
    func subtract(other: Matrix) -> Matrix {
        var result : [Double] = []
        let count = self.values.count
        
        for i in 0..<count {
            result.append(self.values[i] - other.values[i]);
        }
        
        return Matrix(cols:cols, rows:rows, values:result);
    }
}
