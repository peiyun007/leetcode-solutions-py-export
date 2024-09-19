class Solution {
    func minimumDeletions(_ s: String) -> Int {
        var f = 0, g = 0
        let arr = Array(s)
        if arr[0] == "a" {
            f = 0
            g = 1
        } else {
            f = 1
            g = 0
        }
        for i in 1..<arr.count {
            if arr[i] == "a" {
                g += 1
            } else {
                g = min(f, g)
                f += 1
            }
        }
        return min(f, g)
    }
}