# marklogic-preinit-docker
This Dockerfile creates a Docker image of MarkLogic that is pre-initialized, which can help speed up the process of spinning up a MarkLogic container for testing purposes.

# Warning
NOT FOR PRODUCTION USE - ONLY FOR DEV/TEST. 

# How it works
The Dockerfile uses a multi-stage build process:

The first stage starts from the official MarkLogic Docker image, sets the environment variables for the admin username and password, and initializes the MarkLogic server.

The second stage starts from the official MarkLogic Docker image again and copies the MarkLogic server state from the first stage. This leaves us with an image where the MarkLogic server is already initialized.

# Important
The admin username and password are set during the build process. Update the dockerfile and build if you need to change.
- username: admin
- password: admin1234

# How to use
- Clone this repository: git clone https://github.com/menzerr/marklogic-preinit-docker.git
- Build the Docker image: docker build -t menzerr/marklogic-preinit:1.0.0 .
- Run a container from the image: docker run -d menzerr/marklogic-preinit:1.0.0

# Version
Currently, this Dockerfile only supports MarkLogic 11.0.2. Of course, feel free to modify and try other versions.

# Contributing
Contributions are welcome! If you would like to add support for other MarkLogic versions, please feel free to create a pull request.

# License
This project is licensed under the MIT License. See the LICENSE file for details.

# Credits
This Dockerfile is based on an official MarkLogic Docker image.
- https://hub.docker.com/r/marklogicdb/marklogic-db
- https://github.com/marklogic/marklogic-docker



