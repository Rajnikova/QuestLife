# Zadanie
Vo vami zvolenom prostredí vytvorte databázovú aplikáciu,  ktorá komplexne rieši päť vami zadefinovaných scenárov (prípadov použitia) vo vami zvolenej doméne tak, aby ste demonštrovali využitie relačnej databázy podľa pokynov uvedených nižšie. Presný rozsah a konkretizáciu scenárov si dohodnete s Vašim cvičiacim na cvičení. Projekt sa rieši vo dvojiciach, pričom sa očakáva, že na synchronizáciu práce so spolužiakom / spolužiačkou použijete git.

# Quest life
Webová aplikácia, ktorá umožňuje posielanie questov medzi používateľmi. Používateľ si tak môže zaznamenať quest, poslať quest niekomu inému alebo si vybrať z existujúcich questov.
Pod pojmom quest myslím kratšiu, zvyčajne jednoducho formulovanú úlohu za odmenu. 
Používateľ si môže zvoliť miestnosť (room), v ktorej má menšiu skupinu questov. Admini miestností tak môžu vytvárať questy pre návštevníkov.

Aplikácia je implementovaná v Ruby on Rails s použitím HTML, CSS a Javascriptu.

# Opis scenárov

## UC01 Príhlásenie

1. používateľ vyberie možnosť prihlásenia (login)
2. aplikácia zobrazí okno prihlásenia
3. používateľ zadá meno a heslo
4. aplikácia zobrazí stránku používateľa

Výnimkový scenár

1. v kroku 3 bolo zadané nesprávne heslo
2. aplikácia upozorní používateľa výpisom "wrong name or password"

## UC02 Vytvorenie questu

1. používateľ vyberie možnosť "Create quest"
2. systém zobrazí formulár s údajmi o queste a možnosťami.
3. používateľ vyplní názov questu, odmenu a prípadný popis a vyberie z možností "Add to mine"
4. aplikácia vygeneruje quest a prideli ho ako prijatý používateľovi. zároveň sa používateľ stáva autorom tohoto questu

## UC03 Odoslanie questu

1. používteľ vyberie možnosť "Create quest"
2. systém zobrazí formulár s údajmi o queste a možnosťami.
3. používateľ vyplní názov questu, odmenu a prípadný popis a vyberie z možností "Send to other user", kde zadá id používateľa
4. aplikácia vygeneruje quest a zapíše ho ako prijatý pre zadaného používateľa

## UC04 Splnenie questu

1. používateľ si vyberie možnosť "My quests" v ľavom menu
2. aplikácia zobrazí všetky questy, ktoré má používateľ prijaté
3. používateľ si vyberie quest, ktorý chce označiť ako splnený
4. aplikácia zaradí quest medzi splnené a zobrazí "Quest completed"

## UC05 Prijatie questu z existujúcich

1. používateľ si vyberie v ľavom menu "All quests" 
2. Aplikácia zobrazí všetky verejne dostupné questy
3. používateľ si zvolí žiadaný quest a vyberie "Accept"
4. Aplikácia zaradí quest medzi používateľove prijaté questy


# Diagram údajov
![Diagram údajov pre aplikaciu](https://github.com/fiit-dbs-2019/dbs2019-project-assignment-maria-rajnikova/blob/master/doc/model.png)

# LeanCanvas
![Lean Canvas](https://github.com/fiit-dbs-2019/dbs2019-project-assignment-maria-rajnikova/blob/master/doc/leancanvas1.jpg)
---
