class Solution {
    func numberOfWeakCharacters(_ properties: [[Int]]) -> Int {
        let nums = properties.sorted {
            if $0[0] == $1[0] {
                return $0[1] < $1[1]
            } else {
                return $0[0] > $1[0]
            }
        }
        var res = 0
        var maxDef = Int.min
        for arr in nums {
            if arr[1] < maxDef {
                res += 1
            } else {
                maxDef = arr[1]
            }
        }
        return res
    }
}