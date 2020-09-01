//
//  Helper.swift
//  BinaryNews
//
//  Created by Linh Nguyen on 9/1/20.
//  Copyright © 2020 BinaryFuel. All rights reserved.
//

import Foundation
internal func Init<Type>(_ value: Type, block: (_ object: Type) -> Void) -> Type {
    block(value)
    return value
}
