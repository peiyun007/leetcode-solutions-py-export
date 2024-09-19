class Solution {
    func minMutation(_ startGene: String, _ endGene: String, _ bank: [String]) -> Int {
        if startGene == endGene {
            return 0
        }
        if !bank.contains(endGene) {
            return -1
        }
        var queue = [String]()
        var step = 0
        var words = Set<String>(bank)
        var visited = Set<String>()
        queue.append(startGene)
        
        while !queue.isEmpty {
            var size = queue.count
            while size > 0 {
                size -= 1
                let cur = queue.removeFirst()
                if cur == endGene {
                    return step
                }
                if visited.contains(cur) {
                    continue
                }
                visited.insert(cur)
                var temp = Array(cur)
                for (idx, s) in temp.enumerated() {
                    for ch in "ACGT" {
                        if s == ch {
                            continue
                        }
                        temp[idx] = ch
                        defer {
                            temp[idx] = s
                        }
                        let newword = String(temp)
                        if words.contains(newword) {
                            queue.append(newword)
                        }
                    }
                }
            }
            
            step += 1
        }
        return -1
    }
}