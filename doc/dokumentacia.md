# Zadanie
Vo vami zvolenom prostredí vytvorte databázovú aplikáciu,  ktorá komplexne rieši päť vami zadefinovaných scenárov (prípadov použitia) vo vami zvolenej doméne tak, aby ste demonštrovali využitie relačnej databázy podľa pokynov uvedených nižšie. Presný rozsah a konkretizáciu scenárov si dohodnete s Vašim cvičiacim na cvičení. Projekt sa rieši vo dvojiciach, pričom sa očakáva, že na synchronizáciu práce so spolužiakom / spolužiačkou použijete git.

# Quest life
Webová aplikácia, ktorá umožňuje posielanie questov medzi používateľmi. Používateľ si tak môže zaznamenať quest, poslať quest niekomu inému alebo si vybrať z existujúcich questov.
Pod pojmom quest myslím kratšiu, zvyčajne jednoducho formulovanú úlohu za odmenu. 
Používateľ si môže zvoliť miestnosť (room), v ktorej má menšiu skupinu questov. Admini miestností tak môžu vytvárať questy pre návštevníkov.

Aplikácia je implementovaná v Ruby on Rails s použitím HTML, CSS a Javascriptu.

# Opis scenárov - povinné scenáre

## UC01 Domovska stranka
Tennto scenár zobrazuje prehľad záznamov pomocou, kde pri výpočte počtu prijatí questu sa využíva GROUP BY
1. návštevník stránky zadá adresu stranky alebo vyberie možnosť "Home"
2. aplikacia zobrazi upozornenie o novych questoch ak nejaké sú
3. aplikácia zobrazí usera s aktualne najväčším levelom (top user)
4. aplikácia zobrazi prehlad questov, ktore boli splnené najviac krát. Pri počte splnení bola využitá funkcia GROUP BY


## UC02 Zobrazenie questu
Zobrazenie konkrétneho záznamu-questu
1. Návštevník stránky vyberie možnosť "All quests" v ľavom menu
2. Aplikacia zobrazí všetky questy
3. Návštevník stránky vyberie možnosť "Detail" pri queste
4. Aplikácia zobrazí popis vybratého questu

## UC03 Vytvorenie questu
Vytvorenie nového záznamu-quesut
1. používateľ vyberie možnosť "Create quest"
2. systém zobrazí formulár s údajmi o queste a možnosťami.
3. používateľ vyplní názov questu, odmenu a prípadný popis a vyberie z možností "Add to mine"
4. aplikácia vygeneruje quest a prideli ho ako prijatý používateľovi. zároveň sa používateľ stáva autorom tohoto questu

## UC04 Dokončenie questu
aktualizácia existujúceho záznamu, tranzakcia
1. Používateľ vyberie možnosť "My accepted Quests"
2. Aplikacia zobrazí všetky akceptované questy
3. Používateľ vyberie možnosť "Complete" pri queste
4. Aplikácia zmení s tav questu z akceptovaný na splnený

## UC05 Vymazanie questu
Vymazanie záznamu
1. Používateľ vyberie možnosť "Created Quests"
2. Aplikácia zobrazí používateľom vytvorené questy
3. Používateľ vyberie možnosť "Delete"
4. Aplikcia vymaže daný quest z databázy a aj všetky náveznosti naň

# Opis scenárov - nepovinné scenáre

## UC06 Príhlásenie

1. používateľ vyberie možnosť prihlásenia (login)
2. aplikácia zobrazí okno prihlásenia
3. používateľ zadá meno a heslo
4. aplikácia zobrazí stránku používateľa

Výnimkový scenár

1. v kroku 3 bolo zadané nesprávne heslo
2. aplikácia upozorní používateľa výpisom "wrong name or password"

## UC07 Odoslanie questu

1. používteľ vyberie možnosť "Create quest"
2. systém zobrazí formulár s údajmi o queste a možnosťami.
3. používateľ vyplní názov questu, odmenu a prípadný popis a vyberie z možností "Send to other user", kde zadá id používateľa
4. aplikácia vygeneruje quest a zapíše ho ako prijatý pre zadaného používateľa

## UC08 Splnenie questu

1. používateľ si vyberie možnosť "My quests" v ľavom menu
2. aplikácia zobrazí všetky questy, ktoré má používateľ prijaté
3. používateľ si vyberie quest, ktorý chce označiť ako splnený
4. aplikácia zaradí quest medzi splnené a zobrazí "Quest completed"

## UC09 Prijatie questu z existujúcich

1. používateľ si vyberie v ľavom menu "All quests" 
2. Aplikácia zobrazí všetky verejne dostupné questy
3. používateľ si zvolí žiadaný quest a vyberie "Accept"
4. Aplikácia zaradí quest medzi používateľove prijaté questy

## UC10 Vytvorenie novej miestnosti (room)
1. Používateľ vyberie možnosť "Rooms"
2. Aplikácia zobrazí všetky miestnosti
3. Používateľ vyberie možnosť "New room"
4. Aplikácia zobrazí formulár pre údaje o miestnosti
5. Používateľ zadá údaje o miestnosti
6. Aplikácia vytvorí miestnosť a nastaví používateľa ako admina

## UC11 Pridanie qquestu do miestnosti
1. Používateľ vyberie možnosť "All quests" 
2. Aplikácia zobrazí všetky verejne dostupné questy
3. Používateľ vyberie možnosť "Add to room"
4. Aplikácia zobrazí miestnosti, v ktorých je používateľ adminom (má právo pridávať questy)
5. Používateľ vyberie možnosť "Select" pri vybranom queste
6. Aplikácia pridá daný quest do miestnosti a rozošle všetkým členom miestnosti daný quest (ako upozornenie na nový quest)


# Diagram údajov
![Diagram údajov pre aplikaciu](https://github.com/fiit-dbs-2019/dbs2019-project-assignment-maria-rajnikova/blob/master/doc/model2.png)

# LeanCanvas
![Lean Canvas](https://github.com/fiit-dbs-2019/dbs2019-project-assignment-maria-rajnikova/blob/master/doc/leancanvas1.jpg)
---
