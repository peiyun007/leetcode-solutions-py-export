class Solution {
    func countHighestScoreNodes(_ parents: [Int]) -> Int {
        let n = parents.count
        var children = Array(repeating: [Int](), count: n)
        for (i, p) in parents.enumerated() where p != -1 {
            children[p].append(i)
        }
        var cnt = 0
        var maxScore = -1
        dfs(0)
        return cnt

        func dfs(_ x: Int) -> Int {
            var size = n - 1
            var score = 1
            for child in children[x] {
                let childSize = dfs(child)
                size -= childSize
                score *= childSize
            }
            if size > 0 {
                score *= size
            }
            if score == maxScore {
                cnt += 1
            } else if score > maxScore {
                maxScore = score
                cnt = 1
            }
            return n - size
        }
    }
}