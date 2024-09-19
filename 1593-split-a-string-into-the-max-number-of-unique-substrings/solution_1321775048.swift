class Solution {
    func maxUniqueSplit(_ s: String) -> Int {
        var maxSplit = 0
        let sArr = Array(s)
        var set = Set<[Character]>()
        dfs(0, 0)
        return maxSplit

        func dfs(_ idx: Int, _ split: Int) {
            if idx >= sArr.count {
                maxSplit = max(maxSplit, split)
                return
            }
            for i in idx..<sArr.count {
                let tempArr = Array(sArr[idx...i])
                if !set.contains(tempArr) {
                    set.insert(tempArr)
                    dfs(i+1, split+1)
                    set.remove(tempArr)
                }
            }
        }
    }
}