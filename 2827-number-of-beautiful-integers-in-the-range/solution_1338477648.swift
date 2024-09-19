class Solution {
    struct Pair<T: Hashable, U: Hashable, V: Hashable>: Hashable {
        let f: T
        let s: U
        let t: V
        init(_ f: T, _ s: U, _ t: V) {
            self.f = f
            self.s = s
            self.t = t
        }
    }
    typealias Pair3 = Pair<Int, Int, Int>

    func numberOfBeautifulIntegers(_ low: Int, _ high: Int, _ k: Int) -> Int {
        return calc(high) - calc(low-1)

        func calc(_ x: Int) -> Int {
            let sArr = Array(String(x, radix: 10))
            let n = sArr.count
            var memo = [Pair3: Int]()
            return dfs(0, 0, n, true, false)

            func dfs(_ i: Int, _ val: Int, _ diff: Int, _ isLimit: Bool, _ isNumber: Bool) -> Int {
                if i == n {
                    return isNumber && val == 0 && diff == n ? 1 : 0
                }
                if !isLimit && isNumber, let val = memo[Pair3(i, val, diff)] {
                    return val
                }
                var ans = 0
                if !isNumber {
                    ans += dfs(i+1, val, diff, false, false)
                }
                let up = isLimit ? Int(String(sArr[i])) ?? 0 : 9
                let start = isNumber ? 0 : 1
                if start <= up {
                    for d in start...up {
                        ans += dfs(i+1, (val*10+d)%k, diff+(d%2)*2-1, isLimit && d == up, true)
                    }
                }
                if !isLimit && isNumber {
                    memo[Pair3(i, val, diff)] = ans
                }
                return ans
            }
        }
    }
}