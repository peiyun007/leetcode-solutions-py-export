class Solution {
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
    }
    var memo = [Pair<Int, Bool>: Bool]()

    func willWin(_ n: Int, _ alice: Bool) -> Bool {
        if n == 0 {
            return false
        }
        let x = Int(Double(n).squareRoot())
        if Double(x) == Double(n).squareRoot() {
            memo[Pair(f: n, s: alice)] = true
            return true
        }
        if let val = memo[Pair(f: n, s: alice)] {
            return val
        }
        for i in 1...x {
            if !willWin(n - i * i, !alice) {
                memo[Pair(f: n, s: alice)] = true
                return true
            }
        }
        memo[Pair(f: n, s: alice)] = false
        return false
    }

    func winnerSquareGame(_ n: Int) -> Bool {
        return willWin(n, true)
    }
}