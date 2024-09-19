class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        // f[i][j]表示前i天达成第j中状态时的最佳获利是多少
        var f = Array(repeating: Int.min / 2, count: k * 2)
        var res = 0
        for i in 0..<prices.count {
            for j in (0..<2*k).reversed() {
                var flag = j % 2 == 0 ? -1 : 1
                if j == 0 {
                    f[j] = max(f[j], prices[i]*flag)
                } else {
                    f[j] = max(f[j], f[j-1]+prices[i]*flag) 
                }
                print("j=\(j), f[j]=\(f[j])")
                if flag == 1 {
                    res = max(res, f[j])
                }
            }
        }
        return res
    }
}