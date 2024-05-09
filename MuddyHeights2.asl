state("Muddy Heights 2") {}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "Muddy Heights 2";
}

init
{ 
    vars.Helper.TryLoad = (Func<dynamic, bool>)(mono => 
    {
        vars.Helper["level"] = mono.Make<int>("GameManager", "instance", "currentLevel");
        vars.Helper["wasFired"] = mono.Make<bool>("GameManager", "instance", "wasFired");
        vars.Helper["numPoops"] = mono.Make<int>("GameManager", "instance", "numPoops");
        return true;
    });
}

split
{
    return old.level != current.level;
}

start
{
    return (current.level == 0) && (current.wasFired == true) && (current.numPoops == 5);
}
