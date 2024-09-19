class Solution {
    func sumSubseqWidths(_ nums: [Int]) -> Int {
        let numsSorted = nums.sorted { $0 < $1 }
        let mod = 1_0000_0000_7
        var ans = 0
        var p = 1
        for i in 0..<numsSorted.count {
            let x = ((numsSorted[i] - numsSorted[nums.count-i-1]) * p) % mod
            ans = (ans + x) % mod
            p = (p * 2) % mod
        }
        return ans % mod
    }
}