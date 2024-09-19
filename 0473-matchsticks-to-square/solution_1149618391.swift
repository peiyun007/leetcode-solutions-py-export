class Solution {
    private var edge = 0
    private var matchsticksSorted = [Int]()
    func makesquare(_ matchsticks: [Int]) -> Bool {
        let sum = matchsticks.reduce(0, +)
        if sum % 4 != 0 {
            return false
        }
        edge = sum / 4
        matchsticksSorted = matchsticks.sorted { $0 > $1 }
        return findEdges(0, 0, 0, 0, 0)
    }

    func findEdges(_ l1: Int, _ l2: Int, _ l3: Int, _ l4: Int, _ i: Int) -> Bool {
        if l1 == l2, l2 == l3, l3 == l4, l4 == edge {
            return true
        }
        if i > matchsticksSorted.count - 1 {
            return false
        }
        if l1 > edge || l2 > edge || l3 > edge || l4 > edge {
            return false
        }
        return findEdges(l1 + matchsticksSorted[i], l2, l3, l4, i + 1) || findEdges(l1, l2 + matchsticksSorted[i], l3, l4, i + 1) || findEdges(l1, l2, l3 + matchsticksSorted[i], l4, i + 1) || findEdges(l1, l2, l3, l4 + matchsticksSorted[i], i + 1)
    }
}