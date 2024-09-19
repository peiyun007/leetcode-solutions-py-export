class Solution {
    func findLexSmallestString(_ s: String, _ a: Int, _ b: Int) -> String {
        let sArr = Array(s)
        var visited = Set<[Character]>()
        var queue = [[Character]]()
        queue.append(sArr)
        visited.insert(sArr)
        var ans = sArr

        while !queue.isEmpty {
            let cur = queue.removeFirst()
            if isSmaller(cur, ans) {
                ans = cur
            }
            var nxt = cur
            for i in 0..<cur.count {
                if i % 2 == 1 {
                    var y = Int(String(cur[i])) ?? 0
                    y = (y + a) % 10
                    nxt[i] = Array(String(y))[0]
                }
            }
            if !visited.contains(nxt) {
                visited.insert(nxt)
                queue.append(nxt)
            }
            nxt = [Character]()
            for i in cur.count-b..<cur.count {
                nxt.append(cur[i])
            }
            for i in 0..<cur.count-b {
                nxt.append(cur[i])
            }
            if !visited.contains(nxt) {
                visited.insert(nxt)
                queue.append(nxt)
            }
        }
        return String(ans)
    }

    func isSmaller(_ a: [Character], _ b: [Character]) -> Bool {
        for i in 0..<a.count {
            if a[i] < b[i] {
                return true
            } else if a[i] > b[i] {
                return false
            }
        }
        return false
    }
}