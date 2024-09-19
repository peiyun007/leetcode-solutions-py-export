class Solution {
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
        init(_ f: T, _ s: U) {
            self.f = f
            self.s = s
        }
    }
    typealias Pair2 = Pair<Int, Int>

    func canCross(_ stones: [Int]) -> Bool {
        let n = stones.count
        var memo = [Pair2: Bool]()
        return dfs(0, 0)

        func dfs(_ i: Int, _ lastDis: Int) -> Bool {
            if i == n-1 {
                return true
            }
            if let val = memo[Pair2(i, lastDis)] {
                return val
            }
            var ans = false
            for curDis in lastDis-1...lastDis+1 {
                if curDis <= 0 { continue }
                let j = binarySearch(stones[i]+curDis)
                if j != -1 && dfs(j, curDis) {
                    ans = true
                    break
                }
            }
            memo[Pair2(i, lastDis)] = ans
            return ans
        }

        func binarySearch(_ x: Int) -> Int {
            var l = 0, r = n
            while l < r {
                let mid = (l+r) / 2
                if stones[mid] == x {
                    return mid
                } else if stones[mid] < x {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            return -1
        }
    }
}