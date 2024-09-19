class Solution {
    /*  Solution 1  */
    // func uniquePaths(_ m: Int, _ n: Int) -> Int {
    //     if m > n {
    //         return uniquePaths(n, m)
    //     }
    //     var cur = Array<Int>(repeating: 1, count: m)
    //     var pre = Array<Int>(repeating: 1, count: m)
    //     for j in 1..<n {
    //         for i in 1..<m {
    //             cur[i] = cur[i - 1] + pre[i]
    //             pre[i] = cur[i]
    //         }
    //     }
    //     return pre[m-1]
    // }
    
    /* Solution 2 */
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m > n {
            return uniquePaths(n, m)
        }
        var cur = Array<Int>(repeating: 1, count: m)
        for j in 1..<n {
            for i in 1..<m {
                cur[i] += cur[i - 1]
            }
        }
        return cur[m-1]
    }
}