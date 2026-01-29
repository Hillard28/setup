#!/bin/bash
if [ "$USER" = "rgilland" ]; then
	sudo rm -R ~/.venv/base
	python -m venv ~/.venv/base
	source ~/.venv/base/bin/activate
	python -m pip install pip --upgrade
	python -m pip install --upgrade --no-cache-dir \
		black \
		autograd \
		cython \
		datetime \
		duckdb \
		fastexcel \
		geopandas \
		grequests \
		ipykernel \
		ipython \
		jellyfish \
		lifelines \
		linearmodels \
		lxml \
		mapclassify \
		matplotlib \
		maturin \
		numba \
		numpy \
		openpyxl \
		pandas \
		pillow \
		polars \
		pyarrow \
		pypdf \
		requests \
		scikit-learn \
		scipy \
		selenium \
		statsmodels \
		xlsxwriter
fi
