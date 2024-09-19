struct Pair<T: Hashable, U: Hashable>: Hashable {
    let f: T
    let s: U
    init(_ f: T, _ s: U) {
        self.f = f
        self.s = s
    }
}
typealias PairTwo = Pair<Int, Int>

class Solution {
    private let mod = 1_0000_0000_7
    private var memo = [PairTwo: Int]()
    func numberOfWays(_ n: Int, _ x: Int) -> Int {
        return helper(n, x, 1)
    }

    func helper(_ n: Int, _ x: Int, _ i: Int) -> Int {
        if n == 0 {
            return 1
        }
        if i > n {
            return 0
        }
        if let val = memo[PairTwo(n, i)] {
            return val
        }
        let include = helper(n-Int(pow(Double(i), Double(x))), x, i+1)
        let notInclude = helper(n, x, i+1)
        let res = (include + notInclude) % mod
        memo[PairTwo(n, i)] = res
        return res
    }
}