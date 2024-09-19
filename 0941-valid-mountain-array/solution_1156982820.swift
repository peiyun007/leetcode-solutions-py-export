class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        guard arr.count >= 3 else {
            return false
        }
        var l = 0
        var r = arr.count - 1
        while l+1 < arr.count-1 && arr[l] < arr[l+1] {
            l += 1
        }
        while r-1 > 0 && arr[r] < arr[r-1] {
            r -= 1
        }
        return l == r
    }
}