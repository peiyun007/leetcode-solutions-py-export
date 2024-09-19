class Solution {
    func reachNumber(_ target: Int) -> Int {
        var t = abs(target)
        var sum = 0, x = 0
        while sum < t || (sum - t) % 2 == 1 {
            x += 1
            sum += x
        }
        return x
    }
}