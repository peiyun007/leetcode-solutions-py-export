class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        var a = numerator, b = denominator
        if a % b == 0 {
            return String(a/b)
        }
        var chs = [Character]()
        if a * b < 0 {
            chs.append("-")
        }
        a = abs(a)
        b = abs(b)
        chs.append(contentsOf: Array(String(a/b)))
        chs.append(".")
        a %= b
        var map = [Int: Int]()
        while a != 0 {
            map[a] = chs.count
            a *= 10
            chs.append(contentsOf: Array(String(a/b)))
            a %= b
            if let u = map[a] {
                return "\(String(chs[0..<u]))(\(String(chs[u...])))"
            }
        }
        return String(chs)
    }
}