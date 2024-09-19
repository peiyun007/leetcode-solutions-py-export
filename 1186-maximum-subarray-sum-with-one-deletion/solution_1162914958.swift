class Solution {
    func maximumSum(_ arr: [Int]) -> Int {
        var g = 0
        var f = arr[0]
        var res = arr[0]
        for i in 1..<arr.count {
            let num = arr[i]
            g = max(g+num, f)
            f = max(f+num, num)
            res = max(res, max(g, f))
        }
        return res
    }
}