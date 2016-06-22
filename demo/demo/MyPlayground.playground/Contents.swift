//: Playground - noun: a place where people can play

import Cocoa


[1,2,3,3.4,0.3].minElement()

func fibonacci(n:Int) -> Int
{
    if n <= 0
    {
        return -1
    }
    else if n == 1 || n == 2
    {
        return 1
    }
    else
    {
        return fibonacci(n-1) + fibonacci(n-2)
    }

}

fibonacci(-1)
fibonacci(0)
fibonacci(1)
fibonacci(2)
fibonacci(3)
fibonacci(4)
fibonacci(5)
fibonacci(6)
fibonacci(7)

