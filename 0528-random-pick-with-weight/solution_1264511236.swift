class Solution {
    private var total = 0
    private var preSum = [Int]()
    let w: [Int]
    init(_ w: [Int]) {
        self.w = w
        total = w.reduce(0) {$0+$1}
        let n = w.count
        preSum = Array(repeating: 0, count: n+1)
        for i in 1...n {
            preSum[i] = preSum[i-1] + w[i-1]
        }
    }
    
    func pickIndex() -> Int {
        var r = Int.random(in: 1...total)
        var left = 0, right = preSum.count
        while left < right {
            let mid = left + (right - left) / 2
            if preSum[mid] < r {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return max(left-1, 0)
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(w)
 * let ret_1: Int = obj.pickIndex()
 */