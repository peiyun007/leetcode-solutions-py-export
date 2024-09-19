class Solution {
    func numSquarefulPerms(_ nums0: [Int]) -> Int {
        let nums = nums0.sorted()
        let n = nums.count
        var res = 0
        var visited = Array(repeating: false, count: n)
        var temp = [Int]()
        dfs(0)
        return res

        func dfs(_ idx: Int) {
            if idx == n {
                res += 1
            } else {
                for i in 0..<n {
                    if visited[i] || (i > 0 && nums[i] == nums[i-1] && visited[i-1]) {
                        continue
                    }
                    if idx == 0 || isSquare(temp[temp.count-1]+nums[i]) {
                        temp.append(nums[i])
                        visited[i] = true
                        dfs(idx+1)
                        visited[i] = false
                        temp.removeLast()
                    }
                }
            }
        }

        func isSquare(_ num: Int) -> Bool {
            let sqrt1 = Int(Double(num).squareRoot())
            return sqrt1*sqrt1 == num
        }
    }
}