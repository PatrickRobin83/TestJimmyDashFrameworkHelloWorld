// -----------------------------------------------------------------------------
//   Filename          : Program.cs
//   Created By        : Erik (techlead) — Tech Lead Entwicklung
//   Created On        : 2026-08-18
//   Last Modified By  : Erik (techlead)
//   Last Modified On  : 2026-08-18
//   Beschreibung      : Einstiegspunkt der C# Hello-World-Konsolenanwendung.
//                       Gibt "Hello, World!" aus und begrüßt optional eine
//                       übergebene Person (Komandozeilen-Argument).
//   Ausführung        : dotnet run  bzw.  dotnet run -- "Max"
// -----------------------------------------------------------------------------

namespace TestJimmyDashFramworkHelloWorld;

/// <summary>
/// Einstiegspunkt der Anwendung.
/// </summary>
public static class Program
{
    /// <summary>
    /// Gibt eine Begrüßung zurück. Ohne Argument lautet sie "Hello, World!",
    /// mit Argument "Hello, &lt;name&gt;!".
    /// </summary>
    /// <param name="name">Optionaler Name, der begrüßt werden soll.</param>
    /// <returns>Die Begrüßungszeichenkette.</returns>
    public static string BuildGreeting(string? name = null)
    {
        return string.IsNullOrWhiteSpace(name)
            ? "Hello, World!"
            : $"Hello, {name.Trim()}!";
    }

    /// <summary>
    /// Konsolen-Einstiegspunkt.
    /// </summary>
    /// <param name="args">Optional erstes Argument = Name der zu begrüßenden Person.</param>
    public static void Main(string[] args)
    {
        string name = args.Length > 0 ? args[0] : null!;
        Console.WriteLine(BuildGreeting(name));
    }
}
