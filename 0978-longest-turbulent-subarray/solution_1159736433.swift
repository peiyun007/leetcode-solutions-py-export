class Solution {
    func maxTurbulenceSize(_ arr: [Int]) -> Int {
        var up = Array(repeating: 1, count: arr.count)
        var down = Array(repeating: 1, count: arr.count)
        var res = 1
        for i in 1..<arr.count {
            if arr[i] > arr[i-1] {
                up[i] = 1+down[i-1]
                down[i] = 1
            } else if arr[i] < arr[i-1] {
                down[i] = 1+up[i-1]
                up[i] = 1
            } else {
                up[i] = 1
                down[i] = 1
            }
            res = max(res, up[i], down[i])
        }
        return res
    }
}