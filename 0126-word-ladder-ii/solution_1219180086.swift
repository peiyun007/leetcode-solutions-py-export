class Solution {
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        var words = Set<String>(wordList)
        if !words.contains(endWord) {
            return []
        }
        words.remove(beginWord)
        words.remove(endWord)
        var steps = [String: Int]()
        var parents = [String: [String]]()
        var queue = [String]()
        var found = false
        var step = 0
        let l = beginWord.count

        queue.append(beginWord)

        while !queue.isEmpty && !found {
            step += 1
            var size = queue.count
            while size > 0 {
                let cur = queue.removeFirst()
//                var toDel = [String]()
                for i in 0..<l {
                    var chs = Array(cur)
                    for j in "abcdefghijklmnopqrstuvwxyz" {
                        chs[i] = j
                        let wd = String(chs)
                        if wd == endWord {
                            steps[wd] = step + 1
                            var arr = parents[wd] ?? [String]()
                            arr.append(cur)
                            parents[wd] = arr
                            found = true
                        } else {
                            if let sp = steps[wd], sp > step {
                                var arr = parents[wd] ?? [String]()
                                arr.append(cur)
                                parents[wd] = arr
                            }
                        }
                        if !words.contains(wd) {
                            continue
                        }
                        queue.append(wd)
//                        toDel.append(wd)
                        words.remove(wd)
                        
                        steps[wd] = step + 1
                        var arr = parents[wd] ?? [String]()
                        arr.append(cur)
                        parents[wd] = arr
                    }
                }
//                for str in toDel {
//                    print("step=\(step), str=\(str)")
//                    words.remove(str)
//                }

                size -= 1
            }
        }
        if !found {
            return []
        }
        
        var res = [[String]]()
        var temp = [String]()
        temp.insert(endWord, at: 0)
        dfs(&res, &temp, endWord, beginWord, parents)
        return res
    }

    func dfs(_ res: inout [[String]], _ temp: inout [String], _ cur: String, _ beginWord: String, _ parents: [String: [String]]) {
        if cur == beginWord {
            res.append(temp)
            return
        }
        guard let ps = parents[cur] else {
            return
        }
        for node in ps {
            temp.insert(node, at: 0)
            dfs(&res, &temp, node, beginWord, parents)
            temp.removeFirst()
        }
    }
}