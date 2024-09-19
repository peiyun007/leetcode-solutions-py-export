/**
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
**/

class Solution {
    func nextGreatestLetter(_ letters: [Character], _ aa: Character) -> Character {
        guard letters.count > 0 else {
            return Character("")
        }
        if aa >= letters.last! {
            return letters.first!
        }
        let target = Character(UnicodeScalar(String(aa).unicodeScalars.first!.value + 1)!)
        var low = 0
        var high = letters.count - 1
        while low < high {
            let middle = low + (high - low) / 2
            if letters[middle] < target {
                low = middle + 1
            } else if letters[middle] > target {
                high = middle
            } else {
                return letters[middle]
            }
        }
        return letters[low]
    }
}