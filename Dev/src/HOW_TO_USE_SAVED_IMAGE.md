# I got an image, what's next?

Well, first of all archive yours project folder with Image inside into `.zip` format and send it to albana

## Load Image

Once inside, you could unarchive your file to a __local machine__, go into directory and run

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

## Use within Project

Now you can copy `docker-compose.yaml` to your project directory.
Uncomment `volumes:` declaration and __think how to keep your data safely__. Now you can run Docker Image straight from the Project!

Run from your project workspace:
```bash
cd /my/Project/Directory && docker-compose -p <ContainerName> up
```

##### __Important:__
> If your are about to run container from your project, you should copy `include` folder to `<your workspace>/Docker` to contain information and configuration of the used Image.
>
> __That is for next gens could find your image.__
