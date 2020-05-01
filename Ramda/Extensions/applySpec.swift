//
//  applySpec.swift
//  Pods-Ramda_Example
//
//  Created by Christian Leovido on 01/05/2020.
//

import Foundation

extension R {

    /**

     Given a spec object recursively mapping properties to functions,
     creates a function producing an object of the same structure,
     by mapping each property to the result of calling its associated function with the supplied arguments.

     See also converge, juxt.

     - parameter object: an object recursively mapping properties to functions for producing the values for these properties.
     - parameter argument: The function that the arg will be applied to

     - Returns function A function that returns an object of the same structure as `spec', with each property set to the value returned by calling its associated function with the supplied arguments.

     */

    public class func applySpec<A, B>(_ object: [String: (A) -> B]...) -> (A) -> [String: B] {

        return { arg in
            object
                .flatMap({ $0 })
                .reduce(into: [String: B]()) { (current, next) in
                    current[next.key] = next.value(arg)
            }
        }
    }

    public class func applySpec<A, B, C>(_ object: [String: (A, B) -> C]) -> (A, B) -> [String: C] {

        return { first, second in
            object.reduce(into: [String: C]()) { (current, next) in
                current[next.key] = next.value(first, second)
            }
        }
    }

    public class func applySpec<A, B, C, D>(_ object: [String: (A, B, C) -> D]) -> (A, B, C) -> [String: D] {
        return { first, second, third in
            object.reduce(into: [String: D]()) { (current, next) in
                current[next.key] = next.value(first, second, third)
            }
        }
    }

    public class func applySpec<A, B>() -> ([String: (A) -> B]) -> (A) -> [String: B] {
        return { function in { val in applySpec(function)(val) } }
    }

}
