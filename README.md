# IN213

générer du code HTML à partir de texte comme :

BEGH1 "Titre" ENDH1 ; pour <h1> Titre </h1>
BEGP "quelque chose" BEGSTRONG "autre chose" ENDSTRONG ENDP ; pour <p> quelque chose <strong> autre chose </strong> </p>
IMG "nom de fichier" "description" ; pour <img src="nom de fichier" alt="description">

Pour créer un bouton : BEGBTN .... ENDBTN, pour un lien LINK "le lien" "le texte".
Pour une balise h2 : BEGSTITRE .... ENDSTITRE, pour une div BEGDIV .... ENDDIV.

La balise <br> est accessible en écrivant simplement BR.
Les opérations +,-,*,/ sont disponibles.


Pour compiler : 
make clean 
make

Pour exécuter : ./htmlloop nom_de_fichier_contenant les instructions

/!\ il faut un point virgule à la fin d'une instruction