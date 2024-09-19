class Solution {
    func countBalls(_ lowLimit: Int, _ highLimit: Int) -> Int {
        var map = [Int: Int]()
        var ans = 0
        for i in lowLimit...highLimit {
            let sum = Array(String(i)).reduce(0) { $0 + (Int(String($1)) ?? 0) }
            var x = map[sum, default: 0]
            ans = max(ans, x+1)
            map[sum] = x+1
        }
        return ans
    }
}