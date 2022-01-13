# Sphinx

Customized Sphinx docker image based on the [official image](https://github.com/sphinx-doc/docker)

## Supported plugins

- [myst-parser](https://myst-parser.readthedocs.io/en/latest/)
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

## Customization

This container images contains plugins some of which require to change your `conf.py` in your project.

### myst_parser

To activate [myst-parser](https://myst-parser.readthedocs.io/en/latest/), you need to add `myst_parser` into `extensions` and `.md` to `source_suffix`.

```python
extensions = ['myst_parser']
```

```python
source_suffix = {
    '.rst': 'restructuredtext',
    '.txt': 'markdown',
    '.md': 'markdown',
}
```

You can find more info at [Sphinx's doc page](https://www.sphinx-doc.org/ja/master/usage/markdown.html#configuration)

To activate [sphinx-contrib-plantuml](https://github.com/sphinx-contrib/plantuml), add `sphinxcontrib.plantuml` to `extensions` and set `plantuml` with the command to run plantuml.jar.

The jar is bundled at `plantuml/plantuml-1.2022.0.jar` which is published at [Release page of PlantUML](https://github.com/plantuml/plantuml/releases/tag/v1.2022.0)

```python
extensions = [
    'sphinxcontrib.plantuml',
]
```

```python
plantuml = 'java -jar /plantuml/plantuml-1.2022.0.jar'
```

You can find more infomation at [Github Repository of this plugin](https://github.com/sphinx-contrib/plantuml)

