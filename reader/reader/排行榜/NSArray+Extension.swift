//
//  NSArray.swift
//  reader
//
//  Created by YZH on 2018/12/5.
//  Copyright © 2018年 姚智豪. All rights reserved.
//

import Foundation
extension Array{
    func rx_objectAtIndex(index:Int) -> Any? {
        if self.count > index{
            return self[index]
        }
        return nil
    }
}

