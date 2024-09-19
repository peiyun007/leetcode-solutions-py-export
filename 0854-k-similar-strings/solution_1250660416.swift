class Solution {
    func kSimilarity(_ s1: String, _ s2: String) -> Int {
        let arr1 = Array(s1)
        let arr2 = Array(s2)
        let n = arr1.count
        var queue = [([Character], Int)]()
        var visited = Set<[Character]>()
        queue.append((arr1, 0))
        visited.insert(arr1)

        var step = 0
        while !queue.isEmpty {
            var size = queue.count
            while size > 0 {
                let pair = queue.removeFirst()
                let cur = pair.0
                // visited.insert(cur)
                var pos = pair.1
                if cur == arr2 {
                    return step
                }
                while pos < n && cur[pos] == arr2[pos] {
                    pos += 1
                }
                if pos+1 <= arr2.count {
                    for i in pos+1..<n {
                        if cur[i] == arr2[i] {
                            continue
                        }
                        if cur[i] == arr2[pos] {
                            var replaced = cur
                            replaced.swapAt(i, pos)
                            if !visited.contains(replaced) {
                                visited.insert(replaced)
                                queue.append((replaced, pos+1))
                            }
                        }
                    }
                }
                size -= 1
            }

            step += 1
        }
        return step
    }
}