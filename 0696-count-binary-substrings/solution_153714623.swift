class Solution {
    // func countBinarySubstrings(_ s: String) -> Int {
    //     let chars = Array(s)
    //     guard chars.count > 1 else {
    //         return 0
    //     }
    //     var groups = [1]
    //     for i in 1..<chars.count {
    //         if chars[i] != chars[i-1] {
    //             groups.append(1)
    //         } else {
    //             groups[groups.count - 1] += 1
    //         }
    //     }
    //     var result = 0
    //     guard groups.count > 1 else {
    //         return 0
    //     }
    //     for i in 1..<groups.count {
    //         result += min(groups[i], groups[i - 1])
    //     }
    //     return result
    // }
    func countBinarySubstrings(_ s: String) -> Int {
        let chars = Array(s)
        guard chars.count > 1 else {
            return 0
        }
        var pre = 0, cur = 1, result = 0
        for i in 1..<chars.count {
            if chars[i] != chars[i - 1] {
                result += min(pre, cur)
                pre = cur
                cur = 1
            } else {
                cur += 1
            }
        }
        result += min(pre, cur)
        return result
    }
}