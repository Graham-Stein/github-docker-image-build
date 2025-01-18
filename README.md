# Build image from Dockerfile in GitHub Actions

## Outline

This repo is a Hello World example of how to automate building a docker image from a `Dockerfile` and push it to GitHub Container registry using GitHub actions.

## Resources

* [GitHub Actions Documentation](https://docs.github.com/en/actions)
* [Working with the GitHub Container Registry ](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)
* Writing a Dockerfile is not really in the scope of this demo, but [Docker Docs](https://docs.docker.com/get-started/docker-concepts/building-images/writing-a-dockerfile/) explain how it is done.

## Prerequisites

* Admin access is required to the GitHub repo settings to avoid the following permissions error:

Note - If using a personal GitHub account (as opposed to an Organisation Account), only the account owner can have admin rights.

![](/readme_assets/permissions_related_error.png)

**Solution**
    
Navigate to Settings -> Actions

![](/readme_assets/settings_actions.png)

Add:
  *  `read and write permissions`
  * `allow GitHub Actions to create and approve pull requests`
  * See example below

![](/readme_assets/workflow_permissions.png)

## Example

File Structure

```
Project/
├── .github/
│   └── workflows/
│       └── docker-publish.yml
├── Dockerfile
└── hello.py

```

`yml` files stored in `.github/workflows` folder will be considered to be Workflow files by GitHub.

`docker-publish.yml`

Comments have been added to the file to explain the setup.

Full documentation for writing workflows is [here](https://docs.github.com/en/actions/writing-workflows/quickstart).

The Dockerfile is very basic and refers to the even more basic `hello.py` file.

## Pulling image to local

If you need to pull the image to your local machine:

* Create a Personal Access Token [Docs](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token-classic)
* See full docs [here](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-with-a-personal-access-token-classic)
* TLDR; Set the value of the token as an environment variable, eg `export CR_PAT=YOUR_TOKEN`
* Run this command as it is `echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin`
* Get the docker pull command for the package by navigating to Packages:
![](/readme_assets/package.png)
* Run the docker pull command, eg `docker pull ghcr.io/graham-stein/github-docker-image-build/my-image:latest`