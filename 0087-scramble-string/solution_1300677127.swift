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

    func isScramble(_ s1: String, _ s2: String) -> Bool {
        let arr1 = Array(s1)
        let arr2 = Array(s2)
        let n = arr1.count
        var memo = [Pair3: Bool]()
        return dfs(0, 0, n)

        func dfs(_ i: Int, _ j: Int, _ length: Int) -> Bool {
            if let val = memo[Pair3(i, j, length)] {
                return val
            }
            var allEqual = true
            for k in 1...length {
                if arr1[i+k-1] != arr2[j+k-1] {
                    allEqual = false
                    break
                }
            }
            if allEqual {
                memo[Pair3(i, j, length)] = true
                return true
            }
            var ans = false
            for k in 1..<length {
                if dfs(i, j, k) && dfs(i+k, j+k, length-k) {
                    memo[Pair3(i, j, length)] = true
                    return true
                }
                if dfs(i, j+length-k, k) && dfs(i+k, j, length-k) {
                    memo[Pair3(i, j, length)] = true
                    return true
                }
            }
            memo[Pair3(i, j, length)] = ans
            return ans
        }


        func checkIfSimilar(_ i: Int, _ j: Int, _ length: Int) -> Bool {
            var freq = [Character: Int]()
            for k in i..<i+length-1 {
                freq[arr1[k], default: 0] += 1
            }
            for k in j..<j+length-1 {
                freq[arr2[k], default: 0] -= 1
            }
            for (c,x) in freq {
                if x != 0 {
                    return false
                }
            }
            return true
        }
    }
}