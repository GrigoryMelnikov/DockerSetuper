# I got an image, what's next?

## Transfer Image 

Well, the first step is transfer your Image to your workstation via albana. 

First of all archive yours project folder with Image inside into `.zip` format. For expamle:

```
zip -r Jupyter.zip Images/Jupyter
```
> You could also do this easily from file explorer.  

Once you got archive, send it to albana. Open the ticket on `Site` from your workstation, get the codes and load the file via 

> `put the link here`

You'll get a mial once your image arrived to workstation.

## Load Image

Once inside, you could unarchive your file to a __workstation__, go into directory and run

```bash
docker load --input '<Your Project name>/<Your TarBall name>.tar.gz'
```
Now, when image is loaded to your Docker Environment you could run up a container:

```bash
# run up an application
docker-compose -p <ContainerName> up
```

The command will create Container instance with all the ports mapped and ready-to-go.

> Check how to up docker-compose based containers on Windows. There could be a slight differences in invocation.

```bash
echo 'Expamle of loading image'

docker load --input Jupyter
docker-compose -p jupyter-notebook up
```

## __Expremental:__ Use within Project

You can copy `docker-compose.yaml` to your project directory and run up a container from inside your directory. 

This allows quick and easy launch. Moreover, once you put the file it allows better Image control and better project utillization, since next generations could easily find declaration of your container. 

Therefore put `docker-compose.yaml` to project directory and also put files from `<Container>:mnt/Include` to project's subfolder `Docker/`

> You can use all of the tools of `docker-compose` exept mount a volume which is on server side due to __security issue__. This is due _SMB protocol_ requires you put an authentification string into file which supposed to be placed on public server. 
> 
> __Right now consider mount your local folder and save your work on server at the end of each day.__

Run from your project workspace:
```bash
cd /my/Project/Directory && docker-compose -p <ContainerName> up
```
