#!/bin/bash

allennlp train configs/image_srl_lamb_04.jsonnet -s ./image_out04 --include-package srl_json_reader --include-package image_srl_model && \
allennlp train configs/image_srl_lamb_05.jsonnet -s ./image_out05 --include-package srl_json_reader --include-package image_srl_model && \
allennlp train configs/image_srl_lamb_0.3.jsonnet -s ./image_out03 --include-package srl_json_reader --include-package image_srl_model && \
allennlp train ../srl_json/image_srl.jsonnet -s ./image_out_text_only --include-package srl_json_reader && \

echo "succesfully executed"
