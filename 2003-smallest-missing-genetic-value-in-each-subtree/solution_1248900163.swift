class Solution {
    func smallestMissingValueSubtree(_ parents: [Int], _ nums: [Int]) -> [Int] {
        let n = parents.count
        var children = Array(repeating: [Int](), count: n)
        for (i, p) in parents.enumerated() where p != -1 {
            children[p].append(i)
        }
        var geneSet = Set<Int>()
        var res = Array(repeating: 1, count: n)
        var visited = Array(repeating: false, count: n)
        var iNode = 1, node = -1
        for i in 0..<n {
            if nums[i] == 1 {
                node = i
                break
            }
        }
        if node == -1 {
            return res
        }
        while node != -1 {
            dfs(node)
            while geneSet.contains(iNode) {
                iNode += 1
            }
            res[node] = iNode
            node = parents[node]
        }
        return res

        func dfs(_ node: Int) {
            if visited[node] { return }
            visited[node] = true
            geneSet.insert(nums[node])
            for child in children[node] {
                dfs(child)
            }
        }
    }
}