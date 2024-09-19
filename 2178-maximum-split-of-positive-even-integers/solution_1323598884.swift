class Solution {
    func maximumEvenSplit(_ finalSum: Int) -> [Int] {
        if finalSum % 2 != 0 {
            return []
        }
        var ans = [Int]()
        var i = 2
        var sum = finalSum
        while sum >= i {
            ans.append(i)
            sum -= i
            i += 2
        }
        ans[ans.count-1] += sum
        return ans 
    }
}