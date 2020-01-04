# youtubeMy

L'applicazione è per distribuzioni linux, principalmente basate su ubuntu.
Con questo applicazione si può accedere ad una lista di canali youtube precedentemente scelti, è possibile vedere direttamente il video selezionadolo o scaricarlo.
L'applicazione richiede che venga creato un file nominato "canali.conf" con la lista dei url della sezione video dei canali a scelta.
Dopo di che si potra scegliere quale canale visualizzare, selezionato il canele si scegliere se scaricare o guardare i video.
Poi verra visualizata la lista dei primi 30 video del canale, selezionato il numero del video verrà eseguita l'operazione precedentemente scelta.

## Applicazioni richieste:
-youtube-dl

-mpv 

## Configurazione file

### canali.conf
il file deve essere contenere i nome che si vuole dare al canale seguto dal url della sezione video del canale separato da =
```
PewDiePie=https://www.youtube.com/user/PewDiePie/videos
```
