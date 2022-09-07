# I got an image, what's next?

Well, first of all archive your subfolder inside Image into `.zip` format at send it to albana.

Once inside, you could unarchive your file, go into directory and run

`docker-compose -p <ContainerName> up`

        Check how to up docker-compose based containers
        on Windows. There could be a slight differences in
        invocation. 

The command will create Container instance with all the ports mapped and ready-to-go.

Command should be run inside directory containing `docker-compose.yaml`
