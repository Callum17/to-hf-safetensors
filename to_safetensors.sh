#!/bin/bash

set -eou pipefail
script_dir=$(dirname $0)
mod_dir="${1:-}"
if [[ ! -d "$mod_dir" ]]; then
	echo "Bad model directory in arg 1: $mod_dir"
fi
mod_full=$(readlink -e "$mod_dir")
cd "$script_dir"

docker run -v "$script_dir/src":"/workspace/src" -v "$script_dir/hf_out":"/workspace/hf_out" -v "$mod_full":"/workspace/mod_in" to_safetensors:latest
