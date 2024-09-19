class Solution {
    func findAllRecipes(_ recipes: [String], _ ingredients: [[String]], _ supplies: [String]) -> [String] {
        var g = [String: [String]]()
        var inDeg = [String: Int]()
        let n = recipes.count
        for i in 0..<n {
            for ing in ingredients[i] {
                g[ing, default: []].append(recipes[i])
            }
            inDeg[recipes[i]] = ingredients[i].count
        }
        var queue = [String]()
        var res = [String]()
        for sup in supplies {
            queue.append(sup)
        }
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            var deps = g[cur] ?? []
            for nxt in deps {
                inDeg[nxt]? -= 1
                if inDeg[nxt] == 0 {
                    queue.append(nxt)
                    res.append(nxt)
                }
            }
        }
        return res
    }
}