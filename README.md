# youtubeMy

L'applicazione è per distribuzioni linux, principalmente pensata per ubuntu. Con questa applicazione si può accedere ad una lista di canali youtube precedentemente scelti, è possibile vedere direttamente il vide, selezionadolo, o scaricarlo. L'applicazione richiede che venga inserito l'url della pagina display dei video di un canale YouTube, nel file "canali.conf". Si possono caricare più URL di canali in contemporanea, dopo di che si potrà scegliere quale canale visualizzare; scelto il canale, si potrà scegliere se scaricare o guardare i video. Poi verrà visualizzata la lista dei primi 30 video del canale, selezionato il numero del video desiderato verrà eseguita l'operazione precedentemente scelta.

## Applicazioni richieste:
-youtube-dl

-mpv 

## Configurazione file

### canali.conf
Puoi nominare il canale nel file scrivendo il nome scelto davanti all'url, collegando le due sezioni col simbolo =, come mostrato qui sotto.
```
PewDiePie=https://www.youtube.com/user/PewDiePie/videos
```

### By Andrea Baggieri

# youtubeMy

The application is for linux distribution, principally though for ubuntu. With this application you can see the list of channels  that you've previously selected, you can directly see the video or donwload it. You'll need to select the video section in the homepage, from the preferred channel, take the URL of the video's page display, and put It in the file "canali.conf". 
Starting the application youtubeMy.sh, you'll see the list of your selected channels, and you will have the possibility to choose between "see" or "download" any video from them; a new list will create, rapresenting the first 30 videos in the channel, and after selectioning the number representing the chosen video the previous command ("see" or "download") will be executed.

## Application needed 
-youtube-dl

-mpv

## configuration file

### canali.conf
You can name any channel in the file, by writing the nominative and subsequentive the url, with the symbol = in between, as It's showed.
```
PewDiePie=https://www.youtube.com/user/PewDiePie/videos
```
