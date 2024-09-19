class Solution {
    private let mod = 1_0000_0000_7
    func kConcatenationMaxSum(_ arr: [Int], _ k: Int) -> Int {
        var now = 0
        var headMax = 0
        for num in arr {
            now += num
            headMax = max(headMax, now)
        }
        now = 0
        var tailMax = 0
        for num in arr.reversed() {
            now += num
            tailMax = max(tailMax, now)
        }
        var s = 0
        var res = 0
        now = 0
        for num in arr {
            s += num
            now = max(now+num, num)
            res = max(res, now)
        }
        if k >= 2 {
            if s > 0 {
                res = max(res, s * (k-2) + headMax + tailMax) % mod
            } else {
                res = max(res, headMax + tailMax) % mod
            }
        }
        return res
    }
}