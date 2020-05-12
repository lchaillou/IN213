# IN213

générer du code HTML à partir de texte comme :

BEGH1 "Titre" ENDH1 ; pour <h1> Titre </h1>
BEGP "quelque chose" BEGSTRONG "autre chose" ENDSTRONG ENDP ; pour <p> quelque chose <strong> autre chose </strong> </p>

Pour compiler : 
make clean 
make

Pour exécuter : ./htmlloop

/!\ il faut un point virgule à la fin d'une instruction