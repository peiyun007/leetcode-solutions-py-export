class Solution {
    func pushDominoes(_ dominoes: String) -> String {
        let arr = Array(dominoes)
        let n = arr.count
        var queue = [Int]()
        var time = Array(repeating: -1, count: n)
        var force = Array(repeating: [Character](), count: n)
        for (i, c) in arr.enumerated() {
            if c != "." {
                time[i] = 0
                force[i].append(c)
                queue.append(i)
            }
        }
        var res: [Character] = Array(repeating: ".", count: n)
        while !queue.isEmpty {
            let i = queue.removeFirst()
            if force[i].count == 1 {
                let c = force[i][0]
                res[i] = c
                let ni = c == "L" ? (i-1) : (i+1)
                if ni < 0 || ni >= n {
                    continue
                }
                let t = time[i]
                if time[ni] == -1 {
                    time[ni] = t + 1
                    queue.append(ni)
                    force[ni].append(c)
                } else if time[ni] == t+1 {
                    force[ni].append(c)
                }
            }
        }
        return String(res)
    }
}