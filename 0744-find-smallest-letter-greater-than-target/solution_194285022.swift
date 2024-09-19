class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        guard letters.count > 0 else {
            return Character("")
        }
        if target >= letters.last! {
            return letters.first!
        }
        var low = 0
        var high = letters.count - 1
        while low < high {
            let middle = low + (high - low) / 2
            if letters[middle] <= target {
                low = middle + 1
            } else {
                high = middle
            }
        }
        return letters[low] > target ? letters[low] : letters[low + 1]
    }
}