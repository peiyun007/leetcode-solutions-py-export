class Solution {
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
    }
    let mod = 1_0000_0000_7
    func knightDialer(_ n: Int) -> Int {
        let moves = [
            [4,6],
            [6,8],
            [7,9],
            [4,8],
            [3,9,0],
            [],
            [1,7,0],
            [2,6],
            [1,3],
            [2,4],
        ]
        var memo = [Pair<Int, Int>: Int]()
        var totalCount = 0
        for i in 0..<10 {
            let x = (solve(n-1, i, moves, &memo) % mod)
            totalCount = (x+totalCount) % mod
        }
        return totalCount
    }

    func solve(_ remaining: Int, _ currentNum: Int, _ moves: [[Int]], _ memo: inout [Pair<Int, Int>: Int]) -> Int {
        if remaining == 0 {
            return 1
        }
        if let val = memo[Pair(f: remaining, s: currentNum)] {
            return val
        }
        var res = 0
        for num in moves[currentNum] {
            res += (solve(remaining-1, num, moves, &memo) % mod)
        }
        memo[Pair(f: remaining, s: currentNum)] = res
        return res
    }
}