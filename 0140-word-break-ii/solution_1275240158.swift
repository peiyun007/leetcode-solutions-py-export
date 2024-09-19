class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        let wordSet = Set<String>(wordDict)
        let sArr = Array(s)
        var memo = [Int: [[String]]]()
        return dfs(0).map { $0.joined(separator: " ") }

        func dfs(_ index: Int) -> [[String]] {
            var res = [[String]]()
            if let val = memo[index] {
                return val
            }
            if index == sArr.count {
                res.append([])
            }
            for i in index..<sArr.count {
                let cur = String(sArr[index...i])
                if wordSet.contains(cur) {
                    let nexts = dfs(i+1)
                    for nxt in nexts {
                        var temp = [String]()
                        temp.append(cur)
                        temp.append(contentsOf: nxt)
                        res.append(temp)
                    }
                }
            }

            memo[index] = res
            return res
        }
    }
}