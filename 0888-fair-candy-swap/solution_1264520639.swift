class Solution {
    func fairCandySwap(_ aliceSizes: [Int], _ bobSizes: [Int]) -> [Int] {
        let sumA = aliceSizes.reduce(0) {$0+$1}
        let sumB = bobSizes.reduce(0) {$0+$1}
        let delta = (sumA - sumB) / 2
        let set = Set<Int>(aliceSizes)
        for y in bobSizes {
            let x = y + delta
            if set.contains(x) {
                return [x, y]
            }
        }
        return []
    }
}