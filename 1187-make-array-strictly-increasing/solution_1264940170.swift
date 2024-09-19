class Solution {
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U

        init(_ f: T, _ s: U) {
            self.f = f
            self.s = s
        }
    }
    typealias PairTwo = Pair<Int, Int>

    func makeArrayIncreasing(_ arr1: [Int], _ arr2: [Int]) -> Int {
        let a = arr1
        let b = arr2.sorted(by: <)
        let n = arr1.count
        var memo = [PairTwo: Int]()

        let ans = dfs(n-1, Int.max / 2)
        return ans >= Int.max / 2 ? -1 : ans

        func dfs(_ i: Int, _ pre: Int) -> Int {
            if i < 0 {
                return 0
            }
            if let val = memo[PairTwo(i, pre)] {
                return val
            }
            var res = a[i] < pre ? dfs(i-1, a[i]) : Int.max / 2
            let k = bsearch(b, pre)
            if k >= 0 {
                res = min(res, dfs(i-1, b[k])+1)
            }
            memo[PairTwo(i, pre)] = res
            return res
        }

        func bsearch(_ arr: [Int], _ x: Int) -> Int {
            var left = 0, right = arr.count
            while left < right {
                let mid = left + (right - left) / 2
                if arr[mid] < x {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            return left - 1
        }
    }
}