[<AutoOpen>]
module EnvUtils

let cmdargs =
    let getargs (args : string seq) =
        args
        |> (Seq.skipWhile ((<>) "--")
            >> Seq.skip 1
            >> Seq.toArray)
    getargs <| System.Environment.GetCommandLineArgs()
