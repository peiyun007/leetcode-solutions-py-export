class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        var zeroCount = 0
        for x in arr {
            if x == 0 {
                zeroCount += 1
            }
        }
        let set = Set(arr)
        for i in 0..<arr.count {
            if arr[i] != 0 && set.contains(arr[i] * 2) {
                return true
            }
            if arr[i] == 0 && zeroCount >= 2 {
                return true
            }
        }
        return false
    }
}