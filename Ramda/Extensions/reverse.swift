//
// Created by Justin Guedes on 2016/09/20.
//

import Foundation

extension R {

    /**

        Reverses the sequence.

        - parameter sequence: The sequence to reverse.

        - returns: Reversed array.

    */

    public class func reverse<T: SequenceType>(sequence: T) -> [T.Generator.Element] {
        return sequence.reverse()
    }

}
