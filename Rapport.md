# Opdracht Functioneel Paradigma

![alt text](image.png)

"Program testing can be used to show the presence of bugs, but never to show their absence!"

**— Edsger Dijkstra**

| **Studentnaam:** | Nouri el Akel Rahhali |
| :--- | :--- |
| **student Nummer:** | 650002 |
| **Course:** | APP |
| **Datum:** | 29-09-2025 |
| **Docent:** | Dennis Breuker |
| **Versie:** | 1           |

---

## Inhoudsopgave

1. [Inleiding](#inleiding)
2. [Onderzoek](#onderzoek)
3. [Challenge](#challenge)
4. [Implementatie](#implementatie)
5. [Reflectie](#reflectie)
6. [Conclusie](#conclusie)
7. [Bronvermelding](#bronvermelding)

---

## 1. Inleiding

### Doel van de opdracht
Het doel van dit onderzoek is het verkennen en toepassen van het functionele programmeerparadigma door middel van een uitdagende implementatie in de gekozen programmeertaal. Dit verslag beschrijft de theoretische basis, de gekozen challenge en de geleerde lessen.

### Gekozen Programmeertaal
Voor dit onderzoek is gekozen voor **Elixir**.

Ik heb gekozen voor elixir door de toepasbaarheid buiten deze opdracht en course om. Als ik iets nieuws moet leren waarom niet iets waar ik ook nog profijt kan hebben in de toekomst.

Daarnaast is Elixir makkelijker op te pakken dan andere talen en spreekt het mij ook aan dat het evt gebruikt kan worden voor webdevelopment.

Verder is Elixir ook een uitstekende kanidaat om functionele concepten te ontdekken en te leren. Elixir biedt namelijk de volgende concpten aan die mij erg interrsant lijken.

- iummutabilty, van deze term heb ik al eerder gehoord maar nog niet met een taal gewerkt waar alles immutable is.
- Recursie, Dit is meerdere keren aanbod gekomen in de lessen. Een erg vet concept en vereist ook een hele andere manier van denken. Nu kan je ook for loops gebruiken in Elixir dus niet puur functioneel maar daar blijf ik dus ook vanaf voor deze opdracht

-Pattern matching, Dit wekt mijn grootste interresse omdat dit concept geheel nieuw voor mij is en wil het graag gebruiken in mijn code.



## 2. Onderzoek

### Functionele Concepten en Kenmerken van Elixir
Deze sectie behandelt de theoretische concepten en functionaliteiten van Elixir.

#### Pure Functies
ook wel functies genoemd die geen bijwerkingen hebben(side effects)
Idealiter zijn functies “zuiver” dat betekent gegeven dezelfde input geven ze altijd dezelfde output en beïnvloeden ze geen externe toestand. In de praktijk voert je code soms side effects uit 

#### Immutability
In Elixir zijn waarden standaard immutable. Dat betekent dat je een variabele niet kunt aanpassen nadat deze is aangemaakt. In plaats daarvan maak je altijd een nieuwe waarde als je iets wilt veranderen. Dit helpt fouten te voorkomen en maakt je programma’s betrouwbaarder, omdat je zeker weet dat data niet onverwacht wordt overschreven. Dit maakt het gedrag in Elixir voorspelbaar.

```elixir
x = 5
y = x + 2

IO.inspect(x) # => 5
IO.inspect(y) # => 7
```

#### Higher-Order Functions 
Een hogere-orde functie is een functie die met functies zelf kan werken. Dat betekent dat zo’n functie óf een andere functie als argument krijgt, óf zelf een functie teruggeeft. Dit idee is fundamenteel in functioneel programmeren, omdat het functies tot eerste-klasse waarden maakt: je kunt ze net zo behandelen als getallen of lijsten. Je kunt ze doorgeven, opslaan in variabelen of teruggeven uit een andere functie.

Een simpel voorbeeld is Enum.map in Elixir. Deze functie neemt een functie en een lijst en past de functie toe op elk element van die lijst. Bijvoorbeeld:

```elixir
Enum.map([1, 2, 3], fn x -> x + 1 end)
# => [2, 3, 4]
```

Hier is fn x -> x + 1 end de functie die als argument wordt meegegeven. map zelf weet niet wat er moet gebeuren met de elementen, maar gebruikt de meegegeven functie om dat te bepalen.

Dit maakt hogere-orde functies krachtig, omdat je algemene patronen (zoals “iets doen met elk element in een lijst”) kunt hergebruiken, zonder de logica telkens opnieuw te schrijven. Je geeft alleen nog aan wat er moet gebeuren, niet hoe je het moet programmeren.

#### Recursie
Recursie is een techniek waarbij een functie zichzelf aanroept om een probleem op te lossen. In functionele talen zoals Elixir is recursie een belangrijk alternatief voor loops (zoals for of while in imperatieve talen), omdat variabelen onveranderlijk zijn. Recursie werkt vaak door een base case te definiëren waarin de functie stopt, en een recursieve stap die het probleem kleiner maakt en de functie opnieuw aanroept.

```elixir
defmodule Math do
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)
end

IO.inspect(Math.sum(5)) # => 15
```
Recursie is fundamenteel in Elixir en andere functionele talen, omdat het herhaling en iteratie zonder bijwerkingen mogelijk maakt, en het goed combineert met immutable data en hogere-orde functies.

#### Pattern matching

Pattern matching is een kernconcept in Elixir waarmee je data kunt ontleden en vergelijken. In plaats van traditionele vergelijkingen gebruik je een patroon aan de linkerkant van = en een waarde aan de rechterkant. Als de waarde overeenkomt met het patroon, worden variabelen automatisch gevuld. Pattern matching werkt met variabelen, tuples, lijsten, maps, en kan ook gebruikt worden in functies om verschillende gevallen af te handelen. Het maakt code korter, expressiever en minder foutgevoelig, en is vaak een alternatief voor if/else of case-constructies.
```elixir
defmodule Math do
  # base case: lege lijst
  def sum([]), do: 0

  # recursie: eerste element + som van de rest
  def sum([head | tail]), do: head + sum(tail)
end

IO.inspect(Math.sum([1, 2, 3, 4])) # => 10
```

## 3. Challenge

### Beschrijving van de Bedachte Challenge
In deze challenge moet zal ik een Dijkstra pathfinding algoritme implementeren. Het doel is om het kortste pad te vinden in een grote, mogelijk oneindige graaf.

### Waarom de Challenge Uitdagend Is
De challenge is uitdagend om de volgende redenen:

#### Focus op Functionele Concepten:

Deze challenge vereist dat ik meerdere kernconcepten uit functionele programmering toepas.

- Recursie
- Immutability
- Pure functies
- Pattern Matching

#### Waarom dit moeilijker is dan imperatief programmeren:

In imperatieve talen kun je gewoon een lijst aanpassen en met een loop door alle knooppunten gaan. In functionele talen moet je steeds nieuwe versies van lists en maps maken, alles via recursie doen en functies zonder bijwerkingen gebruiken. Dat vraagt meer nadenken om hetzelfde resultaat te bereiken.

 #### Complexiteit:
- Het omzetten van een graph naar een data structuur die het algortime kan verwerken
- het dijkstra algoritme ontwikkelen
- een priority queue ontwikkelen met de middelen die Elixir heeft
- Geen gebruik van externe library

#### Beperkingen:
- Overmatige hulp van AI-tools zoals ChatGPT, Copilot of andere code generators.
- Het hergebruiken van bestaande functionele implementaties zonder toegevoegde waarde.
- Het beperken van de oplossing tot imperatieve of objectgeoriënteerde constructies.


---




## 7. Bronvermelding

Vermeld hier alle gebruikte bronnen, inclusief boeken, websites, artikelen, en in het bijzonder het gebruik van Generatieve AI.

### Literatuur/Websites
[Is elixir still worth learning](https://www.reddit.com/r/elixir/comments/1bi3ibi/is_elixir_still_worth_learning/)

[Why im still betting on elixir in 2025](https://medium.com/beamworld/why-im-still-betting-on-elixir-in-2025-2ca26d4c52b4)

### Gebruik van Generatieve AI (GenAI)
**Tool:** ChatGPT 5

**Doel van Gebruik:** 
Om snelle informatie te verkrijgen over de verschillende talen. En om uiteindelijk meer informatie te krijgen over Elixir zelf en functioneel programmeren

**Verantwoording & Analyse van Output:** 
Door bijbehorende op te vragen van betrouwbare sites / auteurs zo kon ik de informatie achterhalen. Chatgpt vervulde alleen een samenvattende rol.

**Conversatielinks:**

[Link naar gesprek over het kiezen van de beste taal](https://chatgpt.com/share/68dbc0a9-e970-8007-833b-d84db4514d25)

[link naar gesprek over het maken van een adjecent list](https://chatgpt.com/share/68dbc288-0344-8007-b5f1-1bedc7749999)

[Link naar gesprek over functionele concepten](https://chatgpt.com/share/68dbc465-d204-8007-85eb-709c25a82401)

