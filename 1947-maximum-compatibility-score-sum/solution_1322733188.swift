class Solution {
    func maxCompatibilitySum(_ students: [[Int]], _ mentors: [[Int]]) -> Int {
        let n = students.count
        var res = 0
        dfs(0, 0, 0)
        return res
        
        func dfs(_ index: Int, _ mask: Int, _ temp: Int) {
            if index == n {
                res = max(res, temp)
                return
            }
            for i in 0..<n {
                if (mask >> i) & 1 == 0 {
                    var ans = 0
                    for k in 0..<students[index].count {
                        if students[index][k] == mentors[i][k] {
                            ans += 1
                        }
                    }
                    dfs(index+1, mask | (1 << i), temp+ans)
                }
            }
        }
    }
}