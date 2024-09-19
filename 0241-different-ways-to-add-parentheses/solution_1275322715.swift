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
    func diffWaysToCompute(_ expression: String) -> [Int] {
        let add = -1, sub = -2, mul = -3
        let chs = Array(expression)
        var ops = [Int]()
        var i = 0
        while i < chs.count {
            var c = chs[i]
            if c.isASCII && c.isNumber {
                var x = 0
                while c.isASCII && c.isNumber {
                    x = x * 10 + (Int(String(c)) ?? 0)
                    i += 1
                    c = (i < chs.count ? chs[i] : "a")
                }
                ops.append(x)
            } else {
                if c == "+" {
                    ops.append(add)
                } else if c == "-" {
                    ops.append(sub)
                } else if c == "*" {
                    ops.append(mul)
                }
                i += 1
            }
        }
        var memo = [PairTwo: [Int]]()
        return dfs(0, ops.count-1)

        func dfs(_ l0: Int, _ r0: Int) -> [Int] {
            var l = l0, r = r0
            if l == r {
                return [ops[l]]
            }
            if let val = memo[PairTwo(l, r)] {
                return val
            }
            var res = [Int]()
            for i in stride(from: l, to: r, by: 2) {
                let left = dfs(l, i)
                let right = dfs(i+2, r)
                for x in left {
                    for y in right {
                        if ops[i+1] == add {
                            res.append(x+y)
                        } else if ops[i+1] == sub {
                            res.append(x-y)
                        } else if ops[i+1] == mul {
                            res.append(x*y)
                        }
                    }
                }
            }
            memo[PairTwo(l, r)] = res
            return res
        }
    }
}