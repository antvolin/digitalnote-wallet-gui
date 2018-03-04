# digitalnote-wallet-gui
Dockerized wallet Digitalnote with graphical Interface

## REQUIRED

#### Loading the container from the repository <https://hub.docker.com/r/antvolin/digitalnote-wallet-gui/> and the first launch of the container
You may need access to the host screen, in order to allow access - run this command:
  
    xhost +si:localuser:root
***
Folder with wallet data will be created in the location - "<HOME FOLDER YOUR USER>/digitalnote-data/"
  
    mkdir -p $HOME/digitalnote-data && \
    docker run -d --device /dev/dri \
    -e DISPLAY=unix$DISPLAY \
    -v $HOME/digitalnote-data/:$HOME/.digitalnote/ \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    --name=digitalnote-wallet-gui \
    antvolin/digitalnote-wallet-gui:latest
***
#### You can close the wallet by clicking the appropriate button in the wallet window or by running the command:
    docker stop digitalnote-wallet-gui
***
#### If you closed the wallet and want to reopen it - run the command:
    docker start digitalnote-wallet-gui
***
## OPTIONAL
If you want to rebuild the container yourself, run the commands:
  
    docker build --build-arg USER_NAME=$USER \
    -t $USER/digitalnote-wallet-gui:latest .
***
***But keep in mind, if you rebuild the container yourself, you should replace the old container name ("antvolin/digitalnote-wallet-gui") with your own, to execute the command RUN***