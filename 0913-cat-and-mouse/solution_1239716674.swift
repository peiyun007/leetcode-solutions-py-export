class Solution {
    // 参考：https://leetcode.cn/problems/cat-and-mouse/solutions/1685386/by-stormsunshine-k6fn/
    private let HOLE = 0, MOUSE_START = 1, CAT_START = 2
    private let MOUSE_TURN = 0, CAT_TURN = 1
    private let UNKNOWN = 0, MOUSE_WIN = 1, CAT_WIN = 2
    func catMouseGame(_ graph: [[Int]]) -> Int {
        let n = graph.count
        var res = Array(repeating: Array(repeating: Array(repeating: UNKNOWN, count: 2), count: n), count: n)
        var degrees = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: n), count: n)
        var queue = [(Int, Int, Int)]()
        
        for i in 0..<n {
            for j in 1..<n {
                degrees[i][j][MOUSE_TURN] = graph[i].count
                degrees[i][j][CAT_TURN] = graph[j].count
            }
        }
        for i in 0..<n {
            for j in graph[HOLE] {
                degrees[i][j][CAT_TURN] -= 1
            }
        }
        
        for i in 1..<n {
            for t in 0..<2 {
                res[i][i][t] = CAT_WIN
                queue.append((i, i, t))
            }
        }
        for i in 1..<n {
            for t in 0..<2 {
                res[HOLE][i][t] = MOUSE_WIN
                queue.append((HOLE, i, t))
            }
        }
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            let mouse = cur.0, cat = cur.1, turn = cur.2
            let result = res[mouse][cat][turn]
            let preStates = getPreStates(mouse, cat, turn)
            for preState in preStates {
                let preTurn = preState.2
                if res[preState.0][preState.1][preState.2] == UNKNOWN {
                    if preTurn == CAT_TURN && result == CAT_WIN || preTurn == MOUSE_TURN && result == MOUSE_WIN {
                        res[preState.0][preState.1][preState.2] = result
                        queue.append((preState.0, preState.1, preState.2))
                    } else {
                        degrees[preState.0][preState.1][preState.2] -= 1
                        if degrees[preState.0][preState.1][preState.2] == 0 {
                            res[preState.0][preState.1][preState.2] = result
                            queue.append((preState.0, preState.1, preState.2))
                        }
                    }
                }
                
            }
        }
        
        func getPreStates(_ mouse: Int, _ cat: Int, _ turn: Int) -> [(Int, Int, Int)] {
            var arr = [(Int, Int, Int)]()
            let preTurn = turn == MOUSE_TURN ? CAT_TURN : MOUSE_TURN
            if preTurn == CAT_TURN {
                for j in graph[cat] {
                    if j != HOLE {
                        arr.append((mouse, j, preTurn))
                    }
                }
            } else {
                for i in graph[mouse] {
                    arr.append((i, cat, preTurn))
                }
            }
            return arr
        }
        
        return res[MOUSE_START][CAT_START][MOUSE_TURN]
        
    }
}
