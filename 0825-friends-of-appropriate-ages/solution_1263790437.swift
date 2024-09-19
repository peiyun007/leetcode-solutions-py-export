class Solution {
    func numFriendRequests(_ ages: [Int]) -> Int {
        let arr = ages.sorted(by: <)
        var ans = 0, left = 0, right = 0
        let n = arr.count
        for age in arr {
            if age < 15 { continue }
            while arr[left] <= Int(floor(Double(age) * 0.5)) + 7 {
                left += 1
            }
            while right+1 < n && arr[right+1] <= age {
                right += 1
            }
            ans += (right - left)
        }
        return ans
    }
}