# Opdracht Functioneel Paradigma

![alt text](image.png)

"Program testing can be used to show the presence of bugs, but never to show their absence!"

**— Edsger Dijkstra**

| **Studentnaam:** | Nouri el Akel Rahhali |
| :--- | :--- |
| **student Nummer:** | 650002 |
| **Course:** | APP |
| **Datum:** | 03-10-2025 |
| **Docent:** | Dennis Breuker |
| **Repo:** | [Link naar repo](https://github.com/Fruitvliegje/Dijkstra)|
| **Versie:** | 1           |



---

## Inhoudsopgave
1.  [Inleiding](#1-inleiding)
      * [Doel van de opdracht](#doel-van-de-opdracht)
      * [Gekozen programmeertaal](#gekozen-programmeertaal)
2.  [Onderzoek](#2-onderzoek)
      * [Functionele concepten en kenmerken van elixir](#functionele-concepten-en-kenmerken-van-elixir)
          * [Pure functions](#pure-functions)
          * [Immutability](#immutability)
          * [Higher order functions](#higher-order-functions)
          * [Recursie](#recursie)
          * [Pattern matching](#pattern-matching)
3.  [Challenge](#3-challenge)
      * [Beschrijving van de bedachte challenge](#beschrijving-van-de-bedachte-challenge)
      * [Waarom de challenge uitdagend Is](#waarom-de-challenge-uitdagend-is)
4.  [Implementatie](#4-implementatie)
      * [Gebruikte functionele concepten](#gebruikte-functionele-concepten)
          * [Pattern matching](#pattern-matching-1)
          * [Recursie](#recursie-1)
          * [Immutability](#immutability-1)
          * [Higher order functions](#higher-order-functions)
5.  [Reflectie](#5-reflectie)
      * [Denkwijze](#denkwijze)
      * [Wat werkte goed](#wat-werkte-goed)
      * [Wat werkte niet](#wat-werkte-niet)
6.  [Conclusie](#6-conclusie)
7.  [Bronvermelding](#7-bronvermelding)
      * [Literatuur/Websites](#literatuurwebsites)
      * [Gebruik van generatieve AI (GenAI)](#gebruik-van-generatieve-ai-genai)
-----

## 1. Inleiding

### Doel van de opdracht
Het doel van dit onderzoek is het verkennen en toepassen van het functionele programmeerparadigma door middel van een uitdagende implementatie in de van mij gekozen programmeertaal. Dit verslag beschrijft de theoretische basis, de gekozen challenge en de geleerde lessen.

### Gekozen Programmeertaal
Voor deze opdracht is gekozen voor **Elixir**.

Ik heb gekozen voor Elixir vanwege de toepasbaarheid buiten deze opdracht en course. Als ik iets nieuws moet leren, kies ik liever iets waar ik in de toekomst ook profijt van kan hebben.

Daarnaast is Elixir relatief makkelijk op te pakken volgens bronnen in vergelijking met andere talen en spreekt het mij ook aan dat het eventueel gebruikt kan worden voor webdevelopment.

Verder is Elixir een uitstekende keuze om functionele concepten te ontdekken en te leren. De taal biedt namelijk een aantal concepten die ik erg interessant vind:
- Immutability: ik heb deze term al eerder gehoord, maar nog niet gewerkt met een taal waarin alles immutable is.
- Recursie: dit concept is meerdere keren voorbij gekomen in de lessen. Het is erg interessant omdat het een compleet andere manier van denken vereist. In Elixir kun je wel for loops gebruiken, dus het is niet puur functioneel, maar ik blijf in deze opdracht bij de recursieve aanpak.
- Pattern matching: dit concept wekt mijn grootste interesse, omdat het volledig nieuw voor mij is. Ik wil het graag actief toepassen in mijn code.


## 2. Onderzoek

### Functionele Concepten en Kenmerken van Elixir
Deze sectie behandelt de theoretische concepten en functionaliteiten van Elixir. (Functionele programmeer talen)

#### Pure functions
ook wel functies genoemd die geen bijwerkingen hebben(side effects)
Idealiter zijn functies “puur” dat betekent gegeven dezelfde input geven ze altijd dezelfde output en beïnvloeden ze geen externe toestand. 

#### Immutability
In Elixir zijn waarden standaard immutable. Dat betekent dat je een variabele niet kunt aanpassen nadat deze is aangemaakt. In plaats daarvan maak je altijd een nieuwe waarde als je iets wilt veranderen. Dit helpt fouten te voorkomen en maakt je programma’s betrouwbaarder, omdat je zeker weet dat data niet onverwacht wordt overschreven. Dit maakt het gedrag in Elixir voorspelbaar.

```elixir
x = 5
y = x + 2

IO.inspect(x) # => 5
IO.inspect(y) # => 7
```

#### Higher order functions 
Een hogere orde functie is een functie die met functies zelf kan werken. Dat betekent dat zo’n functie of een andere functie als argument krijgt, of zelf een functie teruggeeft. Dit idee is fundamenteel in functioneel programmeren, omdat het functies tot eerste klasse waarden maakt je kunt ze net zo behandelen als getallen of lijsten. Je kunt ze doorgeven, opslaan in variabelen of teruggeven uit een andere functie.

```elixir
Enum.map([1, 2, 3], fn x -> x + 1 end)
# => [2, 3, 4]
```

Hier is fn x -> x + 1 end de functie die als argument wordt meegegeven. map zelf weet niet wat er moet gebeuren met de elementen, maar gebruikt de meegegeven functie om dat te bepalen.

#### Recursie
Recursie gebruikt een techniek waarbij de methode zichzelf aanroept om een probleem op te lossen. Functionele talen gebruiken recursie in plaats van for en while loops, wat je normaliter zou doen in een imperatieve taal. Dit komt doordat variabelen 'immutable' zijn. Elixir biedt for loops aan, maar dit is niet strikt functioneel. Recursie werkt door een 'base case' te definiëren en door dan recursieve stappen uit te voeren totdat de 'base case' bereikt wordt en je uit de functie stapt.

```elixir
defmodule Math do
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)
end

IO.inspect(Math.sum(5)) # => 15
```
Recursie is fundamenteel in Elixir en andere functionele talen, omdat het herhaling en iteratie zonder bijwerkingen mogelijk maakt.

#### Pattern matching

Pattern matching is een kernconcept in Elixir waarmee je data kunt ontleden en vergelijken. In plaats van traditionele vergelijkingen gebruik je een patroon aan de linkerkant van = en een waarde aan de rechterkant. Als de waarde overeenkomt met het patroon, worden variabelen automatisch gevuld. Pattern matching werkt met variabelen, tuples, lijsten, maps, en kan ook gebruikt worden in functies om verschillende gevallen af te handelen. Het maakt code korter, en minder foutgevoelig, en is vaak een alternatief voor if/else of case constructies.
```elixir
defmodule Math do

  def sum([]), do: 0

  def sum([head | tail]), do: head + sum(tail)
end

IO.inspect(Math.sum([1, 2, 3, 4])) # => 10
```

## 3. Challenge

### Beschrijving van de bedachte challenge
In deze challenge zal ik een Dijkstra pathfinding algoritme implementeren. Het doel is om het kortste pad te vinden in een graph.

### Waarom de challenge uitdagend Is
De challenge is uitdagend om de volgende redenen:

#### Focus op functionele concepten:
Deze challenge vereist dat ik meerdere concepten uit functionele programmering toepas.

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
- Overmatige hulp van AI tools zoals ChatGPT, Copilot of andere code generators.
- Het hergebruiken van bestaande functionele implementaties zonder toegevoegde waarde.
- Het beperken van de oplossing tot imperatieve of objectgeoriënteerde constructies.


## 4. Implementatie
De implementatie is opgezet rond een recursieve functie. Het algoritme kent een base case die stopt zodra de queue leeg is en een recursieve case die telkens de kortste afstand selecteert en de bijbehorende buren verwerkt.

Daarnaast heb ik geprobeerd een priority queue te gebruiken, aangezien dit een belangrijk onderdeel van Dijkstra is. Je moet immers steeds het knooppunt met de kleinste afstand als eerste verwerken (eager). Hiervoor heb ik gebruikgemaakt van de hulpmiddelen die Elixir biedt.

In de opdracht wordt verwezen naar lazy evaluation, maar het Dijkstra algoritme staat juist bekend als een eager algoritme. Om het kortste pad te bepalen moeten uiteindelijk alle knopen zijn bezocht. Daarom heb ik het algoritme bewust eager uitgewerkt (klassiek Dijkstra).

### Gebruikte functionele concepten

#### Pattern matching
Pattern matching wordt gebruikt om onderscheidt te maken tussen de base case en de recursieve case. Daarnaast heb ik het ook gebruikt om tuples uit te kunnen pakken.

##### Base case: als de queue leeg is, stopt de recursie
```elixir
defp dijkstra(_graph, distances, []), do: distances
```
##### Uitpakken van tuple {dist, node}
```elixir
{dist, node} = Enum.min_by(queue, fn {d, _} -> d end)
```
#### Recursie
In plaats van loops te gebruiken, wordt de functie dijkstra/3 telkens opnieuw aangeroepen met nieuwe parameters. Hierdoor blijft de implementatie puur en functioneel.

##### Recursieve oproep met bijgewerkte parameters
```elixir
dijkstra(graph, distances, queue)
```

#### Immutability
Datastructuren worden nooit aangepast. In plaats daarvan wordt er steeds een nieuwe versie gemaakt, bijvoorbeeld door Map.put/3 of het toevoegen van een element aan een lijst.

 Maak een nieuwe versie van distances met de kortere afstand:
```elixir
{Map.put(distances, neighbor, new_dist), [{new_dist, neighbor} | queue]}
```
#### Higher order functions

Met Enum.reduce/3 wordt er een lijst buren verwerkt. Elke buur wordt verwerkt in een pure functie, die een nieuwe versie van distances en queue teruggeeft.
```elixir
{distances, queue} =
  Enum.reduce(neighbors, {distances, queue}, fn {neighbor, cost}, {distances, queue} ->
    new_dist = dist + cost
    current_dist = distances[neighbor]

    if current_dist == @infinity or new_dist < current_dist do
      {Map.put(distances, neighbor, new_dist), [{new_dist, neighbor} | queue]}
    else
      {distances, queue}
    end
  end)
```


## 5. Reflectie
Mijn belangrijkste leerpunten van het functionele paradigma zijn:

### Leren van de taal:
In [Onderzoek](#2-onderzoek) heb ik de verschillende functionaliteiten van Elixir onderzocht. De kleine codefragmenten heb ik zelf gemaakt om de concepten te oefenen en om vertrouwd te raken met de syntax van Elixir. Ik merkte dat dit erg hielp door simpele voorbeelden te maken werd het makkelijker om de taal te begrijpen en had ik meteen een kleine opzet of voorbeeld voor de uiteindelijke opdracht. Deze aanpak ga ik vaker gebruiken, in plaats van direct te beginnen met een complex stuk code in een nieuwe taal.

### Denkwijze:
De functionele manier van programmeren dwingt je om anders te denken dan bij imperatief of objectgeoriënteerd programmeren. In plaats van “stap voor stap” code te schrijven die variabelen muteert, werk je met pure functies die onveranderlijke data transformeren. Dit betekende voor mij dat ik continu moest nadenken over data doorgeven en teruggeven in plaats van data aanpassen.

#### Voordelen:
- Immutability maakte de code betrouwbaarder omdat data niet onverwacht kon veranderen, was de logica beter voorspelbaar.
- Pure functies waren makkelijker te testen, omdat de output volledig afhankelijk is van de input.
- Door het gebruik van functies zoals Enum.reduce en Enum.min_by werd de implementatie compacter en leesbaarder dan wanneer ik zelf handmatig lussen had moeten schrijven.

#### Uitdagingen:
Het lastigste vond ik het wennen aan recursie in plaats van loops. Waar ik normaal een for of while loop zou schrijven, moest ik nu de oplossing opdelen in een base case en een recursieve case. 

### Wat werkte goed

Het gebruik van Enum.reduce werkte erg goed om over de buren van een knoop heen te lopen. Het combineerde de update van de afstanden en de queue op een nette manier in één pure functie. Daardoor bleef de code overzichtelijk en was duidelijk hoe de datastructuren transformeerden bij elke stap van het algoritme.

### Wat werkte niet

Het lastigste onderdeel was het implementeren van een priority queue in Elixir. In een imperatieve taal zou je gewoon een ingebouwde datastructuur gebruiken, maar in functioneel Elixir moest ik een manier vinden om de queue telkens als nieuwe lijst of tuple bij te werken zonder mutatie. Waar ik normaal een eenvoudige while (queue not empty) zou schrijven, moest ik nu leren denken in termen van herhaalde functie aanroepen met aangepaste argumenten (pattern matching). 



## 6. Conclusie
Na het grootste gedeelte van mijn schoolcarrière in imperatieve talen te hebben gewerkt, was het verfrissend om een volledig ander paradigma te verkennen. Niet alleen waren de spelregels totaal anders, ook mijn manier van denken moest ik aanpassen. Veel constructies die ik normaal gesproken vanzelfsprekend vond, bleken in een functionele taal niet te werken.

Wat mij vooral is bijgebleven, is dat immutability de code voorspelbaarder en betrouwbaarder maakt en dat pure functies eenvoudiger te testen zijn, omdat de output uitsluitend afhankelijk is van de input. Ook recursie was een belangrijk leerpunt, in plaats van vertrouwde loops moest ik problemen opdelen in een base case en een recursieve case, wat in het begin wennen was maar uiteindelijk leerzaam bleek. Het meest krachtige concept vond ik pattern matching. Daarmee kon ik logica op een overzichtelijke manier structureren zonder if-else constructies, iets wat de leesbaarheid van de code sterk verbeterde.

Hoewel ik waarschijnlijk Elixir zelf niet vaak in mijn carrière zal gebruiken, heeft de opdracht mijn manier van denken verbreed. De inzichten die ik heb opgedaan, zoals het werken met pure functies, immutability en pattern matching. Zijn waardevol en kan ik ook toepassen in imperatieve talen zoals Java. Het ontdekken dat Java in beperkte mate ook pattern matching ondersteunt, bijvoorbeeld via method overloading, laat zien dat de opgedane kennis niet alleen relevant blijft voor deze opdracht maar ook voor toekomstige projecten.


## 7. Bronvermelding

### Literatuur/Websites

Barion, M. (2025). Lesprogramma: Les 2 | Algoritmes, Paradigma’s en Programmeertalen: Grafen en paden [Cursusmateriaal]. HAN University of Applied Sciences. https://aim-cni.github.io/app/docs/Week%203/Les%202/Lesprogramma

coding guy. (2025, 11 januari). *Why I'm Still Betting on Elixir in 2025*. beamworld on Medium. Geraadpleegd op 20-09-2025 [https://medium.com/beamworld/why-im-still-betting-on-elixir-in-2025-2ca26d4c52b4](https://medium.com/beamworld/why-im-still-betting-on-elixir-in-2025-2ca26d4c52b4)

Elixir (programming language). (2025, 21 mei). In *Wikipedia*. Geraadpleegd op 1 oktober 2025, van [https://en.wikipedia.org/wiki/Elixir](https://en.wikipedia.org/wiki/Elixir)\_(programming\_language)

Elixir. (n.d.). *Atom* (v1.18.4). Geraadpleegd op 21-09-2025 [https://hexdocs.pm/elixir/1.18.4/Atom.html](https://hexdocs.pm/elixir/1.18.4/Atom.html)

Mahoney, M. (2025, 22 mei). An Animated Introduction to Elixir. freeCodeCamp.org. https://www.freecodecamp.org/news/an-animated-introduction-to-elixir

Sakhi, S. (2022, 2 juli). The Elixir Language: a Features Summary. Simply-How. https://simply-how.com/elixir-lang

r/elixir. (n.d.). *Is Elixir still worth learning* [Online forumpost]. Reddit. Geraadpleegd op 20-09-2025[https://www.reddit.com/r/elixir/comments/1bi3ibi/is_elixir_still_worth_learning/](https://www.reddit.com/r/elixir/comments/1bi3ibi/is_elixir_still_worth_learning/)

Wikipedia-bijdragers. (n.d.). *Kortstepad-algoritme*. In *Wikipedia*. Geraadpleegd op 28-09-2025[https://nl.wikipedia.org/wiki/Kortstepad-algoritme](https://nl.wikipedia.org/wiki/Kortstepad-algoritme)


### Gebruik van generatieve AI (GenAI)
**Tool:** ChatGPT 5 & Gemini 2.5 Flash

**Doelstelling van het Gebruik**
Het doel van de AI tool was het snel verzamelen van informatie over diverse programmeertalen. Dit ter onderbouwing van de analyse van Elixir en Functioneel Programmeren, Daarnaast ook voor het direct beantwoorden van specifieke vragen, tijdens de uitwerking.

**Verantwoording & Analyse van de Output**
De informatie in de output is gebaseerd op bronnen van betrouwbare sites en auteurs, of is getoetst met eigen kennis. De AI tool werd puur ingezet voor ondersteunende taken (bijvoorbeeld tekstsamenvatting of genereren van eenvoudige codefragmenten) die geen directe inhoudelijke bijdrage leveren aan de opdracht.

**Conversatielinks:**

[Link naar gesprek over het kiezen van de beste taal](https://chatgpt.com/share/68dbc0a9-e970-8007-833b-d84db4514d25)

[Link naar gesprek over het maken van een adjacency list](https://chatgpt.com/share/68dbc288-0344-8007-b5f1-1bedc7749999)

[Link naar gesprek over functionele concepten](https://chatgpt.com/share/68dbc465-d204-8007-85eb-709c25a82401)

[Link naar gesprek console print optimalisatie](https://g.co/gemini/share/9f88f44e4c23)

