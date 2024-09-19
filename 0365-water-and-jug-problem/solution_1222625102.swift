struct Pair<T: Hashable, U: Hashable>: Hashable {
    let f: T
    let s: U

    init(_ f: T, _ s: U) {
        self.f = f
        self.s = s
    }
}
typealias PairTwo = Pair<Int, Int>

class Solution {
    var x = 0, y = 0, target = 0
    var visited = Set<PairTwo>()
    func canMeasureWater(_ x0: Int, _ y0: Int, _ target0: Int) -> Bool {
        x = x0
        y = y0
        target = target0
        return dfs(0, 0)
    }

    func dfs(_ remainX: Int, _ remainY: Int) -> Bool {
        if remainX == target || remainY == target || remainX + remainY == target {
            return true
        }
        if visited.contains(PairTwo(remainX, remainY)) {
            return false
        }
        visited.insert(PairTwo(remainX, remainY))
        let res = dfs(x, remainY)
        || dfs(remainX, y)
        || dfs(0, remainY)
        || dfs(remainX, 0)
        || dfs(remainX - min(remainX, y - remainY), remainY + min(remainX, y - remainY))
        || dfs(remainX + min(remainY, x - remainX), remainY - min(remainY, x - remainX))
        return res
    }
}