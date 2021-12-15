# FUNPEC CHALLENGE DOCKER COMPOSE

* Django/Python
* React
* Postgres

## Proposal

Using Docker Compose, produce one or more docker-compose.yaml that provision the infrastructure needed to upload an environment provisioned with Postgres, Python/Django and React, in their latest versions, solving all necessary dependencies. Provide a Github repository with the file and all the necessary guidelines for running the environment in Readme.md format



## About

Project developed for the technical challenge 02 - 106 DevOps/FUNPEC Programmer



## Steps



* #### Step 1 - Installation

  1. [Install docker compose](https://docs.docker.com/compose/install/)

  2. Clone this repository

     ```shell
     git clone https://github.com/naorye/docker-compose-django-react-postgres.git myapp
     ```

  3. Run `docker-compose up`

     

* #### Step 2 - Images

  ### Web (Python/Django)

  #### Considerations

  * The Zypper package manager was chosen because it is the default Operating System used for the problem;
  * Pip was used to install Django's dependencies;

  - The DRF package was installed to enable communication between Django and React; 

  - The psycopg2-binary package was installed to communicate between Django and postgresql; 

  - Django doesn't support psycopg3, so the latest stable version of psycopg2 has been installed. 

    

  #### System packages

  - [python3.8](https://www.python.org/)

  #### Python packages

  - [Django](https://www.djangoproject.com/)

  ### Postgres

  - As there are no specifics related to the database, the image of the [Docker Official Images](https://docs.docker.com/docker-hub/official_images/).
  - The challenge requests the use of the requirements in their latest versions, in this way, the tag of the latest current version will be used.

  #### Version

  [Postgres 14.1](https://www.postgresql.org/)

  ### React

  * The contents of `.env` should be good enough as is, but you can reconfigure it as needed.
  * Make the entrypoint executable;
  * React dependencies are then installed on our host machine for IDE autocompletion;
  * The images are then built, and the containers ran in [detached mode](https://docs.docker.com/engine/reference/run/#detached--d). The files generated in the previous step is also copied over to the `web` container;
  * We can now boot up the React dev server, with hot reload enabled.

  #### Version

  [React](https://reactjs.org/)

  You can now access the React application on http://localhost:3000/ and the Django API on http://localhost:8000/. 

* #### Step 3 - Running the project

  Create Django Project:

  ```shell
  pip3 install django 
  django-admin startproject django_example
  ```

  Configure Django Database in settings.py:

  ```
  DATABASES = {
      'default': {
          'ENGINE': 'django.db.backends.postgresql_psycopg2',
          'NAME': 'dev',
          'USER': 'dev_user',
          'PASSWORD': 'r00t',
          'HOST': 'db',
          'POST': '5432',
      }
  }
  ```

  Insert the 'rest_framework' in INSTALLED_APPS on django setings:

  ```
  INSTALLED_APPS = [
      '...',
      'rest_framework',
  ]
  ```
  
  Setting database information in Docker Compose variables:
  
  ```shell
  environment:
        - POSTGRES_USER=dev_user
        - POSTGRES_PASSWORD=r00t
        - POSTGRES_DB=dev
  ```
  
  Create the react project:
  
  ```shell
  npm init react-app my-app
  ```
  
  Create the Docker Images:
  
  ```shell
  docker-compose build
  ```
  
  Run project:
  
  ```shell
  docker-compose up
  ```

