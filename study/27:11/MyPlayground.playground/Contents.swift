import Foundation
var a:String = "000000000100000000000000000111111110000000000000110000000000000111111111111011110001000001000100000000000011111111111111000100000110100000000101111111111111111100111101111100000001100011111111111111110000111111110000000000101111111111111111000011111111000001110001000000001111111100000111111100000111111000000000001111100000011000000000011111100000000000011100000001111100000001111000000001111111000000000000110000111111111111011100100100000000000110000001011001000110001010010000000000000000000000100110000011111111110000000000000000001010011011111111111110000000000000000000101101111111111111111000000000000001111111011101111011110111010011110000011111111111111111111111110100001110000001000111000111111111111101000000000000011111111111111111111111000000000000000000000111101111111111110000000000000000001111111111111111111111000010000000000000011111111111111111111100000000000001011111111111111111111111100000000000000000111111111111111111111100100000000000000001111111111111111111110000000000000011101111101111111111111111000001000000000000001111111111111111111110101100111111"
var b:String = ""
var inde:Int = 7
var index:String.Index = 0
func countindex(a:String, inde:Int) -> String.Index {
    let i = a.index(a.startIndex, offsetBy: inde)
    return i
}

while inde < a.count {
    countindex(a: a, inde: inde)
    let c = a[index]
    b.append(c)
    inde += 8
}
print(b)
