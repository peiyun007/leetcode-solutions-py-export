class Solution {
    func snakesAndLadders(_ board: [[Int]]) -> Int {
        let n = board.count
        var queue = [Int]()
        var visited = Array(repeating: false, count: n*n+1)
        queue.append(1)
        visited[1] = true
        var step = 1
        while !queue.isEmpty {
            var size = queue.count
            while size > 0 {
                size -= 1
                let curr = queue.removeFirst()
                for i in 1...6 {
                    var nxt = curr + i
                    if nxt > n * n {
                        break
                    }
                    let (row, col) = id2rc(nxt)
                    if board[row][col] != -1 {
                        nxt = board[row][col]
                    }
                    if nxt == n * n {
                        return step
                    }
                    if !visited[nxt] {
                        visited[nxt] = true
                        queue.append(nxt)
                    }
                }
            }
            
            step += 1
        }
        return -1

        func id2rc(_ i: Int) -> (Int, Int) {
            var row = (i - 1) / n
            var col = (i - 1) % n
            if row % 2 == 1 {
                col = n - 1 - col
            }
            return (n - 1 - row, col)
        }
    }
}