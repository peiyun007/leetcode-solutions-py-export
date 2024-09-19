class Solution {
    func maxChunksToSorted(_ arr: [Int]) -> Int {
        var ans = 0, mx = Int.min
        for i in 0..<arr.count {
            let x = arr[i]
            mx = max(mx, x)
            if mx == i {
                ans += 1
            }
        }
        return ans
    }
}