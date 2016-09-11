//
// Created by Justin Guedes on 2016/09/11.
//

import Foundation

// swiftlint:disable valid_docs
// swiftlint:disable line_length

extension R {

    /**

        Curries supplied function.

        - parameter function: Function with two parameters.

        - returns: Curried function from supplied function.

    */

    public class func curry<A, B, C>(function: (A, B) -> C) -> A -> B -> C {
        return { first in
            return { second in
                return function(first, second)
            }
        }
    }

    /**

        Curries supplied function.

        - parameter function: Function with three parameters.

        - returns: Curried function from supplied function.

    */

    public class func curry<A, B, C, D>(function: (A, B, C) -> D) -> A -> B -> C -> D {
        return { first in
            return { second in
                return { third in
                    return function(first, second, third)
                }
            }
        }
    }

    /**

        Curries supplied function.

        - parameter function: Function with four parameters.

        - returns: Curried function from supplied function.

    */

    public class func curry<A, B, C, D, E>(function: (A, B, C, D) -> E) -> A -> B -> C -> D -> E {
        return { first in
            return { second in
                return { third in
                    return { fourth in
                        return function(first, second, third, fourth)
                    }
                }
            }
        }
    }

    /**

        Curries supplied function.

        - parameter function: Function with five parameters.

        - returns: Curried function from supplied function.

    */

    public class func curry<A, B, C, D, E, F>(function: (A, B, C, D, E) -> F) -> A -> B -> C -> D -> E -> F {
        return { first in
            return { second in
                return { third in
                    return { fourth in
                        return { fifth in
                            return function(first, second, third, fourth, fifth)
                        }
                    }
                }
            }
        }
    }

}

// swiftlint:enable line_length
// swiftlint:enable valid_docs
