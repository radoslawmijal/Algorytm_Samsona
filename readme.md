# Algorytm Samsona dla Sterowania Nieliniowego Monocykla
Projekt realizuje i analizuje działanie nieliniowego algorytmu sterowania – **metody Samsona** – dla nieholonomicznego robota mobilnego o kinematyce monocykla. Układ sterowania uwzględniający strukturę kinematyki oraz dynamiki platformy został zaimplementowany w środowisku MATLAB/Simulink w celu weryfikacji jakości śledzenia zadanej trajektorii referencyjnej.

## Spis treści
1. [Opis Zagadnienia](#opis-zagadnienia)
2. [Struktura Projektu](#struktura-projektu)
3. [Wymagania Systemowe](#wymagania-systemowe)
4. [Uruchomienie](#uruchomienie)
5. [Autorzy i Twórcy](#autorzy-i-twórcy)

## Opis Zagadnienia

Sterowanie robotami mobilnymi z więzami nieholonomicznymi (brak możliwości ruchu bocznego, prostopadłego do osi kół) jest kluczowym wyzwaniem w dziedzinie robotyki autonomicznej. 

**Algorytm Samsona** jest klasycznym i skutecznym podejściem do zadania śledzenia trajektorii (trajectory tracking). Pozwala on na asymptotyczne sprowadzenie uchybów pozycji i orientacji do zera. Istotą metody jest rzutowanie uchybów kinematycznych na lokalny układ współrzędnych związany z robotem oraz zastosowanie nieliniowych sprzężeń zwrotnych, co gwarantuje stabilność układu regulacji w sensie Lapunowa.

W symulacji monocykl realizuje ruch po zadanej trajektorii okręgu o promieniu $R_d = 2$ m z pożądaną prędkością kątową $\omega_d = \pi/6$ rad/s. Model matematyczny uwzględnia następujące parametry fizyczne obiektu:
* Promień koła ($R_k$): 0.075 m
* Odległość osi kół od środka geometrii ($L$): 0.3 m
* Przesunięcie środka masy ($d$): 0 m
* Masa platformy ($M_p$): 97 kg
* Masa pojedynczego koła ($M_k$): 5 kg

## Struktura Projektu

Komponenty repozytorium powiązane z algorytmem Samsona:
* `Samson_278334.slx` – główny model strukturalny w programie Simulink zawierający implementację generatora trajektorii, nieliniowego sterownika kinematycznego Samsona, pętli sterowania dynamicznego oraz modelu dynamiki monocykla.
* `samson_278334.m` – skrypt konfigurujący środowisko MATLAB. Definiuje on parametry masowo-bezwładnościowe robota, warunki początkowe integratora stanu ($q_0$) oraz nastawy regulatorów ($k_1, k_2, K_d$).
* `slprj/` – katalog zawierający pliki pamięci podręcznej (cache) środowiska Simulink oraz raporty kompilacji bloków nieliniowych.

## Wymagania Systemowe

Do poprawnego uruchomienia symulacji wymagane jest posiadanie:
* Środowiska MATLAB
* Oprogramowania Simulink

## Uruchomienie

1. Uruchom program MATLAB i ustaw bieżący folder roboczy (Current Folder) na katalog główny tego projektu.
2. Wczytaj parametry startowe, uruchamiając skrypt konfiguracyjny w oknie komend:
   ```matlab
   monocykl_trajektoria_samson_setup