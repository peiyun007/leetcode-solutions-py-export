class Solution {
    func findDifferentBinaryString(_ nums: [String]) -> String {
        let n = nums.count
        let set = Set<String>(nums)
        var ans = ""
        var temp = [Character]()
        dfs(0, &temp)
        return ans

        func dfs(_ idx: Int, _ temp: inout [Character]) {
            if !ans.isEmpty {
                return
            }
            if idx == n {
                if !set.contains(String(temp)) {
                    ans = String(temp)
                }
                return
            } else {
                temp.append("0")
                dfs(idx+1, &temp)
                temp.removeLast()
                temp.append("1")
                dfs(idx+1, &temp)
                temp.removeLast()
            }
        }
    }
}