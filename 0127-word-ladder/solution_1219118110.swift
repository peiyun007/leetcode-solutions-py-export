class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var words = Set<String>(wordList)
        guard words.contains(endWord) else {
            return 0
        }
        var queue = [String]()
        var step = 0
        let l = beginWord.count

        queue.append(beginWord)
        while !queue.isEmpty {
            step += 1
            var size = queue.count
            while size > 0 {
                let cur = queue.removeFirst()
                for i in 0..<l {
                    var chs = Array(cur)
                    let ch = chs[i]
                    for j in "abcdefghijklmnopqrstuvwxyz" {
                        chs[i] = j
                        let wd = String(chs)
                        if wd == endWord {
                            return step + 1
                        }
                        if !words.contains(wd) {
                            continue
                        }
                        words.remove(wd)
                        queue.append(wd)
                        chs[i] = ch
                    }
                }

                size -= 1
            }
        }
        return 0
    }
}