class Solution {
    func maxDistance(_ position: [Int], _ m: Int) -> Int {
        let arr = position.sorted(by: <)
        let n = arr.count
        var l = 1, r = arr[n-1] - arr[0] + 1
        while l < r {
            let mid = l + (r-l) / 2
            if check(mid) {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return l - 1

        func check(_ x: Int) -> Bool {
            var cnt = 1, pre = 0
            for i in 1..<n {
                if arr[i] - arr[pre] >= x {
                    pre = i
                    cnt += 1
                }
            }
            return cnt >= m
        }
    }
}