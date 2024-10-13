## Vamos a añadir las siguientes variables
ENV_NAME=track_env
ENV_FILE=code/conda_env.yml
NOTEBOOK=workflow.ipynb

## Regla principal
all: install_env run_noebook

## Instalar/actualizar el ambiente de conda con los 
## programas necesarios y activarlo
install_env:
	conda env create -f $(ENV_FILE) || conda env update -f $(ENV_FILE)

## Ejecutar el Jupyter Notebook
run_noebook:
	conda run -n $(ENV_NAME) jupyter nbconvert --to notebook --execute --inplace $(NOTEBOOK)