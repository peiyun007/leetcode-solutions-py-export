class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        let arr2 = arr.sorted { abs($0-x) < abs($1-x) }
        return Array(arr2[0..<k]).sorted(by: <)
    }
}