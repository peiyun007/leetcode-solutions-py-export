class Solution {
    func sortItems(_ n: Int, _ mExt: Int, _ groupExt: [Int], _ beforeItems: [[Int]]) -> [Int] {
        var group = groupExt
        var m = mExt
        for i in 0..<group.count {
            if group[i] == -1 {
                group[i] = m
                m += 1
            }
        }
        var groupAdj = Array(repeating: [Int](), count: m)
        var itemAdj = Array(repeating: [Int](), count: n)
        var groupDegree = Array(repeating: 0, count: m)
        var itemDegree = Array(repeating: 0, count: n)
        for i in 0..<group.count {
            let currentGroup = group[i]
            for item in beforeItems[i] {
                let beforeGroup = group[item]
                if beforeGroup != currentGroup {
                    groupAdj[beforeGroup].append(currentGroup)
                    groupDegree[currentGroup] += 1
                }
            }
        }
        for i in 0..<n {
            for item in beforeItems[i] {
                itemAdj[item].append(i)
                itemDegree[i] += 1
            }
        }
        let groupList = topologicSort(groupAdj, groupDegree, m)
        let itemList = topologicSort(itemAdj, itemDegree, n)
        if groupList.count == 0 {
            return []
        }
        if itemList.count == 0 {
            return []
        }
        var group2Items = [Int: [Int]]()
        for item in itemList {
            group2Items[group[item], default:[]].append(item)
        }
        var res = [Int]()
        for group in groupList {
            res.append(contentsOf: group2Items[group, default: []])
        }
        return res
    }

    func topologicSort(_ g: [[Int]], _ degreesExt: [Int], _ n: Int) -> [Int] {
        var degrees = degreesExt
        var res = [Int]()
        var queue = [Int]()
        for i in 0..<n {
            if degrees[i] == 0 {
                queue.append(i)
            }
        }
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            res.append(cur)
            for nxt in g[cur] {
                degrees[nxt] -= 1
                if degrees[nxt] == 0 {
                    queue.append(nxt)
                }
            }
        }
        if res.count == n {
            return res
        }
        return []
    }
}
