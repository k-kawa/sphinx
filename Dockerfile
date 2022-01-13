FROM sphinxdoc/sphinx

WORKDIR /docs
ADD requirements.txt /docs
RUN pip3 install -r requirements.txt

# Install java and graphviz to use plantuml
RUN apt-get update \
 && apt-get install default-jre graphviz --no-install-recommends -y \
 && apt-get autoremove \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# The jar is from https://github.com/plantuml/plantuml/releases/tag/v1.2022.0
ADD plantuml-1.2022.0.jar /plantuml/plantuml-1.2022.0.jar
