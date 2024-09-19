class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var res = [[Int]]()
        var temp = [Int]()
        dfs(&res, &temp, n, k, 1)
        return res
    }
    
    private func dfs(_ res: inout [[Int]], _ temp: inout [Int], _ n: Int, _ k: Int, _ index: Int) {
        if n == 0 && k == 0 {
            res.append(Array(temp))
            return
        }
        if n <= 0 || k == 0 || index > 9  {
            return
        }
        for i in index...9 {
            temp.append(i)
            dfs(&res, &temp, n - i, k - 1, i + 1)
            temp.removeLast()
        }
    }
}