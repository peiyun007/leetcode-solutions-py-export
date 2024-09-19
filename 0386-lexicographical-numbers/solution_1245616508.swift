class Solution {
    func lexicalOrder(_ n: Int) -> [Int] {
        var res = Array(repeating: 0, count: n)
        var num = 1
        for i in 0..<n {
            res[i] = num
            if num * 10 <= n {
                num *= 10
            } else {
                while num % 10 == 9 || num >= n {
                    num = num / 10
                }
                num += 1
            }
        }
        return res
    }
}