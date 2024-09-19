class Solution {
    func totalFruit(_ fruits: [Int]) -> Int {
        var ans = 0
        var cnt = [Int: Int]()
        var left = 0
        for right in 0..<fruits.count {
            cnt[fruits[right]] = cnt[fruits[right], default: 0] + 1
            while cnt.count > 2 {
                cnt[fruits[left]] = cnt[fruits[left], default: 0] - 1
                if let val = cnt[fruits[left]], val == 0 {
                    cnt[fruits[left]] = nil
                }
                left += 1
            }
            ans = max(ans, right-left+1)
        }
        return ans
    }
}