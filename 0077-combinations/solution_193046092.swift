class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res = [[Int]]()
        var temp = [Int]()
        dfs(&res, &temp, n, k, 1)
        return res
    }
    
    private func dfs(_ res: inout [[Int]], _ temp: inout [Int], _ n: Int, _ k: Int, _ index: Int) {
        if k == 0 {
            res.append(Array(temp))
            return
        }
        if index > n {
            return
        }
        for i in index...n {
            temp.append(i)
            dfs(&res, &temp, n, k - 1, i + 1)
            temp.removeLast()
        }
    }
}