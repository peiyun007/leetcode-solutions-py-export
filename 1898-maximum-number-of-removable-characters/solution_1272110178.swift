class Solution {
    func maximumRemovals(_ s: String, _ p: String, _ removable: [Int]) -> Int {
        let sArr = Array(s)
        let pArr = Array(p)
        let n = removable.count
        var l = 0, r = n
        while l < r {
            let mid = l + (r-l) / 2
            if check(mid) {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return l-1+1

        func check(_ x: Int) -> Bool {
            var st = Array(repeating: true, count: sArr.count)
            for i in 0...x {
                st[removable[i]] = false
            }
            var j = 0
            for i in 0..<sArr.count {
                if st[i] && sArr[i] == pArr[j] {
                    j += 1
                }
                if j == pArr.count {
                    return true
                }
            }
            return false
        }
    }
}