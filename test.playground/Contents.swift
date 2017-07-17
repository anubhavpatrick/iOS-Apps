//: Playground - noun: a pl
class Rectangle{
    var length:Int=1
    var breadth:Int=1
    var area:Int{
        get{
            return length*breadth
        }
        set{
            length=newValue/2
            breadth=newValue/2
        }
    }
}
class Photo:Rectangle{
    override var area: Int{
        willSet{
            print(newValue)
        }
        didSet{
            print(oldValue)
        }
    }
}
var obj=Photo()
obj.area=100
print("hi")