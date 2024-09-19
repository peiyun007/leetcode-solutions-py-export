class Solution {
    var visited = Set<Int>()
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        dfs(rooms, 0)
        return visited.count == rooms.count
    }

    func dfs(_ rooms: [[Int]], _ idx: Int) {
        if visited.contains(idx) {
            return
        }
        visited.insert(idx)
        for i in rooms[idx] {
            dfs(rooms, i)
        }
    }
}