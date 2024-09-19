class Solution {
    func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {
        let n = edges.count
        let dis1 = calDis(node1)
        let dis2 = calDis(node2)
        var minDis = n
        var ans = -1
        for i in 0..<n {
            let larger = max(dis1[i], dis2[i])
            if larger < minDis {
                minDis = larger
                ans = i
            }
        }
        return ans
        
        func calDis(_ i: Int) -> [Int] {
            var dis = Array(repeating: n, count: n)
            var x = i
            var d = 0
            while x != -1 && dis[x] == n {
                dis[x] = d
                d += 1
                x = edges[x]
            }
            return dis
        }
    }
}