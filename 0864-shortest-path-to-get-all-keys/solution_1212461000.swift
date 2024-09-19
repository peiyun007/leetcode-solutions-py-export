extension String {
    subscript(_ idx: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: idx)]
    }
}

class Solution {
    // 参考：花花酱
    struct Pair<T: Hashable, U: Hashable, V: Hashable>: Hashable {
        let f: T
        let s: U
        let t: V
    }

    func shortestPathAllKeys(_ grid: [String]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var visited = [Pair<Int, Int, Int>: Bool]()
        var queue = [(Int, Int, Int)]()
        var allKeys = 0
        var steps = 0
        let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]

        for i in 0..<grid.count {
            let arr = Array(grid[i])
            for j in 0..<arr.count {
                if arr[j] == "@" {
                    queue.append((i, j, 0))
                    visited[Pair(f: i, s: j, t: 0)] = true
                } else if arr[j] >= "a" && arr[j] <= "f" {
                    let val = arr[j].asciiValue! - Character("a").asciiValue!
                    allKeys += 1 << val
                }
            }
        }
        while !queue.isEmpty {
            var size = queue.count
            while size > 0 {
                let (x, y, keys) = queue.removeFirst()
                if keys == allKeys {
                    return steps
                }
                for dir in dirs {
                    let nx = x + dir.0
                    let ny = y + dir.1
                    var nKeys = keys
                    if nx < 0 || nx >= m || ny < 0 || ny >= n {
                        continue
                    }
                    let a = grid[nx][ny]
                    if a == "#" {
                        continue
                    }
                    if a >= "A" && a <= "F" {
                        let p = 1 << (a.asciiValue! - Character("A").asciiValue!)
                        if keys & p == 0 {
                            continue
                        }
                    }
                    if a >= "a" && a <= "f" {
                        let p = 1 << (a.asciiValue! - Character("a").asciiValue!)
                        nKeys |= p
                    }
                    if let val = visited[Pair(f: nx, s: ny, t: nKeys)] {
                        continue
                    }
                    visited[Pair(f: nx, s: ny, t: nKeys)] = true
                    queue.append((nx, ny, nKeys))
                }
                size -= 1
            }
            steps += 1
        }
        return -1
    }
}