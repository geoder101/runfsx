#!/usr/bin/env runfsx

#load "env.fsx"

let greeting = System.String.Join(" ", cmdargs)
printfn "%s" greeting
