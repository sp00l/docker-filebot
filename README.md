# docker-filebot
---

    docker run -it --name filebot \
    -v /home/filebot:/data \ # Verzeichnis für Log-Dateien
    -v /home/jdownloader/extracted/:/input \ # Input Verzeichnis
    -v /home/media/:/output \ # Output Verzeichnis
    sidirius/docker-filebot
