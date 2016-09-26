//
// Created by Justin Guedes on 2016/09/26.
//

import Foundation

// swiftlint:disable line_length

extension R {

    /**

        Returns a new list excluding all the leading elements of a given list which
        satisfy the supplied predicate function. It passes each value to the supplied
        predicate function, skipping elements while the predicate function returns true.

        - parameter predicate: Function that returns bool based on argument.
        - parameter sequence: The sequence.

        - returns: A new sequence with the elements dropped from the start while the
        predicate was satisfied.

    */

    public class func dropWhile<A, B: SequenceType, C: SequenceType
                               where A == B.Generator.Element, C == B.SubSequence, A == B.Generator.Element, C == C.SubSequence>(predicate: A -> Bool, in sequence: B) -> C {
        var newSequence = sequence.dropFirst(0)
        var reversed = R.reverse(sequence)
        while let element = reversed.last where predicate(element) {
            newSequence = R.drop(1, in: newSequence)
            reversed.removeLast()
        }

        return newSequence
    }

    /**

        Returns a new list excluding all the leading elements of a given list which
        satisfy the supplied predicate function. It passes each value to the supplied
        predicate function, skipping elements while the predicate function returns true.

        - parameter predicate: Function that returns bool based on argument.

        - returns: A curried function that accepts the sequence and returns a new
        sequence with the elements dropped from the start while the predicate was
        satisfied.

    */

    public class func dropWhile<A, B: SequenceType, C: SequenceType
                               where A == B.Generator.Element, C == B.SubSequence, A == B.Generator.Element, C == C.SubSequence>(predicate: A -> Bool) -> (in: B) -> C {
        return curry(dropWhile)(predicate)
    }

}

// swiftlint:enable line_length
