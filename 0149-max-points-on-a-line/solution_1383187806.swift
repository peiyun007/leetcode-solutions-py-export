class Solution {
    func maxPoints(_ points: [[Int]]) -> Int {
        let n = points.count
        var ans = 1
        for i in 0..<n {
            var mx = 0
            var map = [String: Int]()
            let x = points[i]
            for j in i+1..<n {
                let y = points[j]
                let a = y[1] - x[1]
                let b = y[0] - x[0]
                let k = gcd(a, b)
                let key = "\(a/k)_\(b/k)"
                map[key, default: 0] += 1
                mx = max(mx, map[key, default: 0])
            }
            ans = max(ans, mx+1)
        }
        return ans
    }

    func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }
}