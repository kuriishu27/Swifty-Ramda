//
// Created by Justin Guedes on 2016/09/18.
//

import Foundation

extension R {

    /**

        Returns the smaller of the two arguments.

        - parameter lhs: The left hand side operand.
        - parameter rhs: The right hand side operand.

        - returns: The smaller of the two arguments.

    */

    public class func min<T: Comparable>(lhs: T, or rhs: T) -> T {
        return R.lt(lhs, than: rhs) ? lhs : rhs
    }

    /**

        Returns the smaller of the two arguments.

        - parameter lhs: The left hand side operand.

        - returns: A curried function that accepts the second operand
        and returns the smaller of the two arguments.

    */

    public class func min<T: Comparable>(lhs: T) -> (or: T) -> T {
        return curry(min)(lhs)
    }

}
