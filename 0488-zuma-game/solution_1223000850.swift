struct Pair<T: Hashable, U: Hashable>: Hashable {
    let f: T
    let s: U
    init(_ f: T, _ s: U) {
        self.f = f
        self.s = s
    }
}
typealias PairTwo = Pair<[Character], [Character]>

class Solution {
    // 参考leetcode.cn的官方解法
    func findMinStep(_ s1: String, _ s2: String) -> Int {
        let board = Array(s1)
        let hand = Array(s2).sorted { $0 < $1 }
        var queue = [([Character], [Character])]()
        var visited = Set<PairTwo>()
        queue.append((board, hand))
        visited.insert(PairTwo(board, hand))
        var step = 0

        while !queue.isEmpty {
            var size = queue.count
            while size > 0 {
                size -= 1
                let cur = queue.removeFirst()
                let cur_board = cur.0
                let cur_hand = cur.1
//                if cur_board.isEmpty {
//                    return step
//                }

                for i in 0...cur_board.count {
                    for j in 0..<cur_hand.count {
                        // 第 1 个剪枝条件: 当前球的颜色和上一个球的颜色相同
                        if j > 0 && cur_hand[j] == cur_hand[j-1] {
                            continue
                        }
                        // 第 2 个剪枝条件: 只在连续相同颜色的球的开头位置插入新球
                        if i >= 1 && cur_board[i-1] == cur_hand[j] {
                            continue
                        }
                        // 第 3 个剪枝条件: 只在以下两种情况放置新球
                        var choose = false
                        // - 第 1 种情况 : 当前球颜色与后面的球的颜色相同
                        if i < cur_board.count && cur_board[i] == cur_hand[j] {
                            choose = true
                        }
                        if i > 0 && i < cur_board.count && cur_board[i-1] == cur_board[i] && cur_board[i] != cur_hand[j] {
                            choose = true
                        }
                        if choose {
                            var new_board = cur_board
                            new_board.insert(cur_hand[j], at: i)
                            new_board = clean(new_board)
                            var new_hand = cur_hand
                            new_hand.remove(at: j)
                            if new_board.isEmpty {
                                return step + 1
                            }
                            if visited.contains(PairTwo(new_board, new_hand)) {
                                continue
                            }
                            visited.insert(PairTwo(new_board, new_hand))
                            queue.append((new_board, new_hand))
                        }
                    }
                }
            }
            step += 1
        }
        return -1
    }

    func clean(_ s: [Character]) -> [Character] {
        var ans = [Character]()
        var i = 0
        var changed = false
        while i < s.count {
            if i + 2 < s.count && s[i] == s[i+1] && s[i] == s[i+2] {
                var k = 0
                while i + k < s.count && s[i+k] == s[i] {
                    k += 1
                }
                i += k
                changed = true
            } else {
                ans.append(s[i])
                i += 1
            }
        }
        let res = changed ? clean(ans) : ans
        return res
    }
}