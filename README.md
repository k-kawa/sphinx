# Sphinx

Customized Sphinx docker image based on the [official image](https://github.com/sphinx-doc/docker)

## Supported plugins

- [myst-parser](https://www.sphinx-doc.org/ja/master/usage/markdown.html#configuration)
- [sphinxcontrib-plantuml](https://github.com/sphinx-contrib/plantuml)

## Usage

### Run on Cloud Build

Create a docker image named `gcr.io/$PROJECT_ID/sphinx` in your GCP Project.

```shell
gcloud --project=YOUR-PROJECT builds submit . --config=cloudbuild.yaml
```

Use it in `cloudbuild.yaml` in your Sphinx document repository

```yaml
steps:
- name: gcr.io/$PROJECT_ID/sphinx
  args:
  - make
  - html
```
