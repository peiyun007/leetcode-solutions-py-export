class Solution {
    func countMatches(_ items: [[String]], _ ruleKey: String, _ ruleValue: String) -> Int {
        var ans = 0
        for item in items {
            if ruleKey == "type" && item[0] == ruleValue {
                ans += 1
            } else if ruleKey == "color" && item[1] == ruleValue {
                ans += 1
            } else if ruleKey == "name" && item[2] == ruleValue {
                ans += 1
            }
        }
        return ans
    }
}