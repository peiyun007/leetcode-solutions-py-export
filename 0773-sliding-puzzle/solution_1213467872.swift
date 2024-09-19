class Solution {
    let kRows = 2
    let kCols = 3
    let dirs = [(-1,0), (1,0), (0,-1), (0,1)]
    func slidingPuzzle(_ board: [[Int]]) -> Int {
        var goal = [Int]()
        var start = [Int]()
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                start.append(board[i][j])
                goal.append(kCols * i + j + 1)
            }
        }
        goal.removeLast()
        goal.append(0)
        if start == goal {
            return 0
        }
        
        var queue = [[Int]]()
        var visited = [[Int]: Bool]()
        var step = 0
        
        queue.append(start)
        while !queue.isEmpty {
            step += 1
            var size = queue.count
            while size > 0 {
                let cur = queue.removeFirst()
                visited[cur] = true
                let index = cur.index(of: 0) ?? 0
                let px = index / kCols
                let py = index % kCols
                for dir in dirs {
                    let nx = px + dir.0
                    let ny = py + dir.1
                    if nx < 0 || nx >= kRows || ny < 0 || ny >= kCols {
                        continue
                    }
                    var arr = cur
                    let ni = nx * kCols + ny
                    arr.swapAt(index, ni)
                    if visited[arr] != nil {
                        continue
                    }
                    if arr == goal {
                        return step
                    }
                    queue.append(arr)
                }
                
                size -= 1
            }
        }
        return -1
    }
}