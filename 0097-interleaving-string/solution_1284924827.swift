class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let arr1 = Array(s1)
        let arr2 = Array(s2)
        let arr3 = Array(s3)
        var f = Array(repeating: Array(repeating: false, count: arr2.count + 1), count: arr1.count + 1)
        if arr1.count + arr2.count != arr3.count {
            return false
        }
        f[0][0] = true
        for i in 0...arr1.count {
            for j in 0...arr2.count {
                let p = i + j - 1
                if i >= 1 {
                    f[i][j] = f[i][j] || (f[i-1][j] && arr1[i-1] == arr3[p])
                }
                if j >= 1 {
                    f[i][j] = f[i][j] || (f[i][j-1] && arr2[j-1] == arr3[p])
                }
            }
        }
        return f[arr1.count][arr2.count]
    }
}