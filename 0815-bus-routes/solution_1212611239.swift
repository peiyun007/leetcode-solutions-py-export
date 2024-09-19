class Solution {
    // 参考：花花酱
    func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
        if source == target {
            return 0
        }
        var map = [Int: [Int]]()
        let m = routes.count
        var visited = Array(repeating: false, count: routes.count)
        var queue = [Int]()
        for i in 0..<m {
            for stop in routes[i] {
                var buses = map[stop] ?? [Int]()
                buses.append(i)
                map[stop] = buses
            }
        }
        queue.append(source)

        var ans = 0
        while !queue.isEmpty {
            var size = queue.count
            ans += 1
            while size > 0 {
                let cur = queue.removeFirst()
                guard let arr = map[cur] else {
                    return -1
                }
                for bus in arr {
                    if visited[bus] {
                        continue
                    }
                    visited[bus] = true
                    for stop in routes[bus] {
                        if stop == target {
                            return ans
                        }
                        queue.append(stop)
                    }
                }
                size -= 1
            }
        }
        return -1
    }
}