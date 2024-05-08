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
        return true;
    });
}

split
{
    return old.level != current.level;
}