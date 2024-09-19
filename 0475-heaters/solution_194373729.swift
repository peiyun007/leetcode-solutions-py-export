class Solution {
    func findRadius(_ arr1: [Int], _ arr2: [Int]) -> Int {
        let houses = arr1.sorted(by: <)
        let heaters = arr2.sorted(by: <)
        var res = Array(repeating: Int.max, count: houses.count)
        var i = 0, j = 0
        while i < houses.count && j < heaters.count {
            if heaters[j] >= houses[i] {
                res[i] = heaters[j] - houses[i]
                i += 1
            } else {
                j += 1
            }
        }
        i = houses.count - 1
        j = heaters.count - 1
        while i >= 0 && j >= 0  {
            if heaters[j] <= houses[i] {
                res[i] = min(res[i], houses[i] - heaters[j])
                i -= 1
            } else {
                j -= 1
            }
        }
        var maxRes = 0
        for i in res {
            if i > maxRes {
                maxRes = i
            }
        }
        return maxRes
    }
}