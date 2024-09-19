class Solution {
    func minimumPerimeter(_ neededApples: Int) -> Int {
        var left = 1, right = 100000
        var ans = 0
        while left < right {
            let mid = left + (right - left) / 2
            let x = 2 * Double(mid) * Double(mid + 1) * Double(2 * mid + 1)
            if x >= Double(neededApples) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return 8 * left
    }
}