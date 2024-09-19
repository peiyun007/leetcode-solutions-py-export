class Solution {
    func countSubTrees(_ n: Int, _ edges: [[Int]], _ labels: String) -> [Int] {
        let labelArr = Array(labels)
        var g = Array(repeating: [Int](), count: n)
        var count = Array(repeating: 0, count: n)
        for e in edges {
            g[e[0]].append(e[1])
            g[e[1]].append(e[0])
        }
        dfs(-1, 0)
        return count

        func dfs(_ from: Int, _ x: Int) -> [Int] {
            var curCount = Array(repeating: 0, count: 26)
            let chIndex = getIndex(labelArr[x])
            curCount[chIndex] += 1
            for y in g[x] {
                if y == from { continue }
                let arr = dfs(x, y)
                for i in 0..<curCount.count {
                    curCount[i] += arr[i]
                }
            }
            count[x] = curCount[chIndex]
            return curCount
        }
    }

    func getIndex(_ c: Character) -> Int {
        return Int(c.asciiValue ?? 0) - Int(Character("a").asciiValue ?? 0)
    }
}